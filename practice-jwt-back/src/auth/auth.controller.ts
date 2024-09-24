import { Controller, Post, Body, Get, UseGuards, Request } from '@nestjs/common';
import { IAuthService } from './interfaces/auth.service.interface';
import { UserDTO } from '../user/user.dto';
import { JwtAuthGuard } from './jwt-auth.guard'; 

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: IAuthService) {}

  @Post('register')
  async register(@Body() userDto: UserDTO) {
    return await this.authService.createUser(userDto);
  }

  @Post('login')
  async login(@Body() userDto: UserDTO) {
    return await this.authService.validateUser(userDto);
  }

  @Post('token/refresh')
  async refreshTokens(@Body('refreshToken') refreshToken: string) {
    return await this.authService.refreshAccessToken(refreshToken);
  }

  @UseGuards(JwtAuthGuard)
  @Get('protected/resource')
  getProtectedResource(@Request() req: any) {
    const user = req.user;
    return { data: `This is a protected resource for ${user.email}` };
  }
}
