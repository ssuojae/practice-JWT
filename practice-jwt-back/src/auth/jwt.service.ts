import { Injectable } from '@nestjs/common';
import * as jwt from 'jsonwebtoken';
import { UserEntity } from '../user/user.entity';
import { IJwtService } from './interfaces/jwt.service.interface';

@Injectable()
export class JwtService implements IJwtService {
  signToken(user: UserEntity) {
    const payload = { id: user.id, email: user.email };
    const accessToken = jwt.sign(payload, process.env.JWT_SECRET, {
      expiresIn: '1h',
    });
    const refreshToken = jwt.sign(payload, process.env.JWT_SECRET, {
      expiresIn: '7d',
    });

    return { accessToken, refreshToken };
  }

  verifyToken(token: string) {
    try {
      return jwt.verify(token, process.env.JWT_SECRET);
    } catch {
      return null;
    }
  }
}
