import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { UserRepository } from '../user/user.repository';
import { JwtService } from './jwt.service';
import { RedisService } from './redis.service';
import { UserEntity } from '../user/user.entity';
import { IAuthService } from './interfaces/auth.service.interface';
import { IUserRepository } from '../user/interfaces/user.repository.interface';
import { IJwtService } from './interfaces/jwt.service.interface';
import { IRedisService } from './interfaces/redis.service.interface';
import { typeOrmConfig } from '../config/database.config';
import { redisConfig } from '../config/redis.config'; // Redis 설정

@Module({
    imports: [
        TypeOrmModule.forRoot(typeOrmConfig),
        TypeOrmModule.forFeature([UserEntity]),
    ],
    controllers: [AuthController],
    providers: [
        {
            provide: IAuthService,
            useClass: AuthService,
        },
        {
            provide: IUserRepository,
            useClass: UserRepository,
        },
        {
            provide: IJwtService,
            useClass: JwtService,
        },
        {
            provide: IRedisService,
            useClass: RedisService,
        },
        {
            provide: 'JWT_SECRET',
            useValue: process.env.JWT_SECRET,
        },
        {
            provide: 'REDIS_OPTIONS',
            useValue: redisConfig,
        },
    ],
    exports: [
        {
            provide: IJwtService,
            useClass: JwtService,
        },
        {
            provide: IRedisService,
            useClass: RedisService,
        },
    ],
})
export class AuthModule {}
