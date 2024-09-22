import { Injectable } from '@nestjs/common';
import Redis from 'ioredis';
import { IRedisService } from './interfaces/redis.service.interface';

@Injectable()
export class RedisService implements IRedisService {
  private readonly redisClient = new Redis();

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
