import { UserEntity } from '../../user/user.entity';

export abstract class IJwtService {
  abstract signToken(user: UserEntity): { accessToken: string, refreshToken: string };
  abstract verifyToken(token: string): any;
}
