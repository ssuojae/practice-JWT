export abstract class IRedisService {
  abstract storeRefreshToken(userId: string, token: string): Promise<void>;
  abstract getRefreshToken(userId: string): Promise<string>;
  abstract invalidateToken(userId: string): Promise<void>;
}
