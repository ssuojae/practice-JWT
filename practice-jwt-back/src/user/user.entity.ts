import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';
import {IsString} from "class-validator";

@Entity('users')
export class UserEntity {
  @PrimaryGeneratedColumn('uuid')
  id: string;


  @Column({ unique: true })
  @IsString({
    message: 'email은 String 타입을 입력해줘야 합니다.'
  })
  email: string;

  @Column()
  @IsString({
    message: 'password는 String 타입을 입력해줘야 합니다.'
  })
  password: string;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
