import { Injectable, Inject } from '@nestjs/common';
import { Redis } from 'ioredis';
import { IRedisService } from './interfaces/redis.service.interface';
import { RedisOptions } from 'ioredis';

@Injectable()
export class RedisService implements IRedisService {
  private redisClient: Redis;

  constructor(
      @Inject('REDIS_OPTIONS') private readonly redisOptions: RedisOptions,
  ) {
    this.redisClient = new Redis(redisOptions);
  }

  async storeRefreshToken(userId: string, token: string): Promise<void> {
    await this.redisClient.set(userId, token);
  }

  async getRefreshToken(userId: string): Promise<string> {
    return this.redisClient.get(userId);
  }

  async invalidateToken(userId: string): Promise<void> {
    await this.redisClient.del(userId);
  }
}
