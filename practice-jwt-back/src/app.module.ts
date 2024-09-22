import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule } from '@nestjs/config';
import { typeOrmConfig } from './config/database.config';
import { RedisService } from 'nestjs-redis';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true, // 환경 변수를 전역에서 사용 가능하게 설정
    }),
    TypeOrmModule.forRoot(typeOrmConfig), // PostgreSQL 설정
  ],
  providers: [RedisService], // Redis 서비스 등록
})
export class AppModule {}
