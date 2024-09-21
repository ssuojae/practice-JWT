import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule } from '@nestjs/config';
import { RedisService } from './redis.service';
import { typeOrmConfig } from './config/database.config';

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
