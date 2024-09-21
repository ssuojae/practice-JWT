import { Injectable, OnModuleInit } from '@nestjs/common';
import Redis from 'ioredis';
import { redisConfig } from './config/redis.config';

@Injectable()
export class RedisService implements OnModuleInit {
  private client: Redis;

  onModuleInit() {
    this.client = new Redis(redisConfig); // ioredis 클라이언트 초기화
  }

  getClient() {
    return this.client; // Redis 클라이언트 반환
  }
}