import { RedisOptions } from 'ioredis';
import * as dotenv from 'dotenv';

// .env 파일을 로드
dotenv.config();

export const redisConfig: RedisOptions = {
  host: process.env.REDIS_HOST || 'localhost',
  port: parseInt(process.env.REDIS_PORT, 10) || 6379,
};
