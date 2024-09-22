import { Injectable, Inject } from '@nestjs/common';
import * as jwt from 'jsonwebtoken';
import { IJwtService } from './interfaces/jwt.service.interface';
import { UserEntity } from '../user/user.entity';

@Injectable()
export class JwtService implements IJwtService {
  constructor(@Inject('JWT_SECRET') private readonly jwtSecret: string) {}

  signToken(user: UserEntity) {
    const payload = { id: user.id, email: user.email };
    const accessToken = jwt.sign(payload, this.jwtSecret, { expiresIn: '1h' });
    const refreshToken = jwt.sign(payload, this.jwtSecret, { expiresIn: '7d' });

    return { accessToken, refreshToken };
  }

  verifyToken(token: string) {
    try {
      return jwt.verify(token, this.jwtSecret);
    } catch (error) {
      console.error('Token verification error:', error);
      return null;
    }
  }
}
