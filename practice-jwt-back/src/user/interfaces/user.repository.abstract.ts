import { UserEntity } from "../user.entity";

export abstract class IUserRepository {
  abstract findUserByEmail(email: string): Promise<UserEntity | null>;
  abstract saveUser(user: UserEntity): Promise<UserEntity>;
}