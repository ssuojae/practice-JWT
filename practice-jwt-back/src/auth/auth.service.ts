import {Inject, Injectable} from '@nestjs/common';
import { IUserRepository } from '../user/interfaces/user.repository.interface';
import { IJwtService } from './interfaces/jwt.service.interface';
import { IRedisService } from './interfaces/redis.service.interface';
import { UserDTO } from '../user/user.dto';
import { UserEntity } from '../user/user.entity';
import { IAuthService } from './interfaces/auth.service.interface';
import { Bcrypt } from './bcrypt';

@Injectable()
export class AuthService implements IAuthService {
  constructor(
      private readonly userRepository: IUserRepository,
      private readonly jwtService: IJwtService,
      private readonly redisService: IRedisService,
  ) {}

  async createUser(
    userDto: UserDTO,
  ): Promise<{ accessToken: string; refreshToken: string }> {
    const user = await this.userRepository.findUserByEmail(userDto.email);
    if (user) throw new Error('User already exists');

    const hashedPassword = await Bcrypt.hash(userDto.password);
    const newUser = new UserEntity();
    newUser.email = userDto.email;
    newUser.password = hashedPassword;

    const savedUser = await this.userRepository.saveUser(newUser);

    const token = this.jwtService.signToken(savedUser);
    await this.redisService.storeRefreshToken(savedUser.id, token.refreshToken);
    return token;
  }

  async validateUser(
    userDto: UserDTO,
  ): Promise<{ accessToken: string; refreshToken: string }> {
    const user = await this.userRepository.findUserByEmail(userDto.email);
    if (!user) {
      throw new Error('User not found');
    }
    const isPasswordValid = await Bcrypt.compare(
      userDto.password,
      user.password,
    );
    if (!isPasswordValid) {
      throw new Error('Invalid credentials');
    }
    const token = this.jwtService.signToken(user);
    await this.redisService.storeRefreshToken(user.id, token.refreshToken);
    return token;
  }

  async refreshAccessToken(
    refreshToken: string,
  ): Promise<{ accessToken: string }> {
    console.log('Received refreshToken:', refreshToken);

    const userId = await this.redisService.getRefreshToken(refreshToken);
    console.log('Retrieved userId:', userId);

    if (!userId) throw new Error('Invalid refresh token');

    const user = await this.userRepository.findById(userId);
    console.log('Retrieved user:', user);

    if (!user) throw new Error('User not found');

    const newAccessToken = this.jwtService.signToken(user).accessToken;
    return { accessToken: newAccessToken };
  }
}
