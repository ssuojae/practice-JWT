import {
  Inject,
  Injectable,
  UnauthorizedException,
  ConflictException,
  NotFoundException,
  InternalServerErrorException,
} from '@nestjs/common';
import { IUserRepository } from '../../user/interfaces/user.repository.interface';
import { IJwtService } from '../interfaces/jwt.service.interface';
import { IRedisService } from '../interfaces/redis.service.interface';
import { UserDTO } from '../../user/user.dto';
import { UserEntity } from '../../user/user.entity';
import { IAuthService } from '../interfaces/auth.service.interface';
import { BcryptService } from './bcrypt.service';
import { IbcryptService } from '../interfaces/bcrypt.service.interface';

@Injectable()
export class AuthService implements IAuthService {
  constructor(
    @Inject(IUserRepository) private readonly userRepository: IUserRepository,
    @Inject(IJwtService) private readonly jwtService: IJwtService,
    @Inject(IRedisService) private readonly redisService: IRedisService,
    @Inject(IbcryptService) private readonly bcryptService: BcryptService,
  ) {}

  async createUser(
    userDto: UserDTO,
  ): Promise<{ accessToken: string; refreshToken: string }> {
    try {
      const user = await this.userRepository.findUserByEmail(userDto.email);
      if (user) {
        throw new ConflictException('User already exists'); // 에러 처리 개선
      }

      const hashedPassword = await this.bcryptService.hash(userDto.password); // BcryptService 사용
      const newUser = new UserEntity();
      newUser.email = userDto.email;
      newUser.password = hashedPassword;

      const savedUser = await this.userRepository.saveUser(newUser);

      const token = this.jwtService.signToken(savedUser);
      await this.redisService.storeRefreshToken(
        savedUser.id,
        token.refreshToken,
      );
      return token;
    } catch (error) {
      throw new InternalServerErrorException('Could not create user');
    }
  }

  async validateUser(
    userDto: UserDTO,
  ): Promise<{ accessToken: string; refreshToken: string }> {
    try {
      const user = await this.userRepository.findUserByEmail(userDto.email);
      if (!user) {
        throw new NotFoundException('User not found');
      }

      const isPasswordValid = await this.bcryptService.compare(
        userDto.password,
        user.password,
      );
      if (!isPasswordValid) {
        throw new UnauthorizedException('Invalid credentials');
      }

      const token = this.jwtService.signToken(user);
      await this.redisService.storeRefreshToken(user.id, token.refreshToken);
      return token;
    } catch (error) {
      throw new InternalServerErrorException('Could not validate user');
    }
  }

  async refreshAccessToken(
    refreshToken: string,
  ): Promise<{ accessToken: string }> {
    try {
      console.log('Received refreshToken:', refreshToken);

      const userId = await this.redisService.getRefreshToken(refreshToken);
      console.log('Retrieved userId:', userId);

      if (!userId) throw new UnauthorizedException('Invalid refresh token');

      const user = await this.userRepository.findById(userId);
      console.log('Retrieved user:', user);

      if (!user) throw new NotFoundException('User not found');

      const newAccessToken = this.jwtService.signToken(user).accessToken;
      return { accessToken: newAccessToken };
    } catch (error) {
      throw new InternalServerErrorException('Could not refresh access token');
    }
  }
}
