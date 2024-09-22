import { Injectable } from '@nestjs/common';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { UserEntity } from './user.entity';
import { IUserRepository } from './interfaces/user.repository.interface';

@Injectable()
export class UserRepository implements IUserRepository {
  constructor(
    @InjectRepository(UserEntity)
    private readonly userRepo: Repository<UserEntity>,
  ) {}

  async findUserByEmail(email: string): Promise<UserEntity> {
    return this.userRepo.findOne({ where: { email } });
  }

  async saveUser(user: UserEntity): Promise<UserEntity> {
    return this.userRepo.save(user);
  }

  async findById(id: string): Promise<UserEntity | null> { // findById 구현
    return this.userRepo.findOne({ where: { id } });
  }
}
