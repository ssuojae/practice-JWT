import { UserEntity } from '../user.entity';

export abstract class IUserRepository {
  abstract findUserByEmail(email: string): Promise<UserEntity>;
  abstract saveUser(user: UserEntity): Promise<UserEntity>;
  abstract findById(id: string): Promise<UserEntity | null>;
}
