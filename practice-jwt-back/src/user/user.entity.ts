import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';

@Entity('users') // 'users'라는 테이블과 매핑
export class UserEntity {
  @PrimaryGeneratedColumn('uuid') // id는 자동 생성, UUID 형식
  id: string;

  @Column({ unique: true }) // 이메일은 고유한 값으로 설정
  email: string;

  @Column() // 비밀번호는 일반 텍스트로 저장하지 않고, 해시된 값을 저장
  password: string;

  @CreateDateColumn() // 생성 시 자동으로 날짜 저장
  createdAt: Date;

  @UpdateDateColumn() // 업데이트 시 자동으로 날짜 업데이트
  updatedAt: Date;
}
