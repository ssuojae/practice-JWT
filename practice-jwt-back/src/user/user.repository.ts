import {Inject, Injectable} from '@nestjs/common';
import { UserEntity } from './user.entity';
import { IUserRepository } from './interfaces/user.repository.interface';

@Injectable()
export class UserRepository implements IUserRepository {
    constructor(
        @Inject('IUserRepository')
        private readonly userRepository: IUserRepository,
    ) {}

    async findUserByEmail(email: string): Promise<UserEntity> {
        return this.userRepository.findUserByEmail(email);
    }

    async saveUser(user: UserEntity): Promise<UserEntity> {
        return this.userRepository.saveUser(user);
    }

    async findById(id: string): Promise<UserEntity | null> {
        return this.userRepository.findById(id);
    }
}