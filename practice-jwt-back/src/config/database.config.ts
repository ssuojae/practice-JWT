import { TypeOrmModuleOptions } from '@nestjs/typeorm';
import * as dotenv from 'dotenv';

// .env 파일을 로드
dotenv.config();

export const typeOrmConfig: TypeOrmModuleOptions = {
  type: 'postgres',
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT, 10) || 5432,
  username: process.env.POSTGRES_USER, // 환경변수로부터 유저명 받음
  password: process.env.POSTGRES_PASSWORD, // 환경변수로부터 비밀번호 받음
  database: process.env.POSTGRES_DB, // 환경변수로부터 DB 이름 받음
  entities: [__dirname + '/../**/*.entity.{js,ts}'],
  synchronize: true, // 개발 환경에서만 true
};
