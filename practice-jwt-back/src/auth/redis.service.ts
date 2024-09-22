import { Injectable } from '@nestjs/common';
import { Redis } from 'ioredis';
import { IRedisService } from './interfaces/redis.service.interface';
import { redisConfig } from '../config/redis.config'; // redisConfig 불러오기

@Injectable()
export class RedisService implements IRedisService {
  private redisClient: Redis;

  constructor() {
    this.redisClient = new Redis(redisConfig); // redisConfig 사용하여 Redis 클라이언트 생성
  }

  async storeRefreshToken(userId: string, token: string): Promise<void> {
    await this.redisClient.set(token, userId); // 토큰을 키로, 사용자 ID를 값으로 저장
  }

  async getRefreshToken(userId: string): Promise<string> {
    return this.redisClient.get(userId);
  }

  async invalidateToken(userId: string): Promise<void> {
    await this.redisClient.del(userId);
  }
}
