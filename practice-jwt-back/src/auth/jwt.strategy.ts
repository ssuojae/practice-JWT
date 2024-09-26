import { Injectable, UnauthorizedException, Inject } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { IUserRepository } from '../user/interfaces/user.repository.interface';
import { UserEntity } from '../user/user.entity';
import { IJwtStrategy } from './interfaces/jwt.strategy.interface';

@Injectable()
export class JwtStrategy
  extends PassportStrategy(Strategy, 'jwt')
  implements IJwtStrategy
{
  constructor(
    private readonly userRepository: IUserRepository,
    @Inject('JWT_SECRET') private readonly jwtSecret: string,
  ) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      secretOrKey: jwtSecret,
    });
  }

  async validate(payload: { id: string }): Promise<UserEntity> {
    const user = await this.userRepository.findById(payload.id);
    if (!user) {
      throw new UnauthorizedException('User not found');
    }
    return user;
  }
}
