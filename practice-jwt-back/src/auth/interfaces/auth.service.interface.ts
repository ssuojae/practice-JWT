import { UserDTO } from '../../user/user.dto';

export abstract class IAuthService {
  abstract createUser(
    userDto: UserDTO,
  ): Promise<{ accessToken: string; refreshToken: string }>;
  abstract validateUser(
    userDto: UserDTO,
  ): Promise<{ accessToken: string; refreshToken: string }>;
  abstract refreshAccessToken(
    refreshToken: string,
  ): Promise<{ accessToken: string }>;
}
