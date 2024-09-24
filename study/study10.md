## JWT 기반 자동 로그인 및 Private Route 설정


### 1. 고민하게 된 계기
- JWT는 사용자의 로그인 상태를 유지할 수 있는 유용한 방식이다. 사용자는 로그인 시 Access Token과 Refresh Token을 발급받고, 이를 통해 인증 상태를 유지한다.
- 그러나, JWT만으로는 매번 사용자가 로그인할 때마다 토큰을 재발급받는 번거로움이 발생할 수 있다. 
- JWT 토큰을 사용한 인증 시스템에서, 사용자가 로그인 후 별도의 인증 과정 없이 보호된 리소스에 접근할 수 있도록 Private Route를 구성해야한다는 필요성을 느꼈다. 


<br/>
<br/>

#

### 2. 문제 해결 과정

#### 2.1 JWT 토큰의 활용

- 프로젝트에서는 passport-jwt를 활용하여 JWT 토큰을 검증하고, Private Route를 통해 인증된 사용자만이 보호된 리소스에 접근할 수 있도록 하였다.

#### 2.2 Private Route (Protected Resource Access)
Private Route는 인증된 사용자만이 접근할 수 있는 보호된 경로이다. 이를 구현하기 위해, NestJS에서는 passport-jwt를 사용하여 JwtAuthGuard를 설정하고, JWT 토큰을 검증하는 과정을 자동화하였다.

```typescript
import { Controller, Get, UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from './guards/jwt-auth.guard';

@Controller('protected')
export class ProtectedController {
  @UseGuards(JwtAuthGuard)
  @Get('resource')
  getProtectedResource() {
    return { data: '이 리소스는 인증된 사용자만 접근할 수 있습니다.' };
  }
}
```
JwtAuthGuard는 사용자가 요청을 보낼 때마다 Authorization 헤더에 포함된 JWT 토큰을 검증하고, 유효한 토큰을 가진 사용자만 해당 경로에 접근할 수 있도록 한다.

#### 2.3 자동 로그인 구현
자동 로그인을 위해서는 로그인 시 발급된 JWT 토큰을 클라이언트에 저장하고, 이후 앱이나 웹사이트를 다시 열었을 때 저장된 토큰을 통해 서버에 인증 요청을 보낸다. 이때, passport-jwt를 사용하여 간단하게 토큰 검증을 처리할 수 있다.

자동 로그인 흐름:

- 로그인 후 발급된 JWT 토큰을 클라이언트에 저장.
- 앱 재접속 시 클라이언트가 JWT 토큰을 Authorization 헤더에 담아 요청.
- 서버는 JwtAuthGuard를 통해 토큰을 검증하고, 인증이 완료된 경우 Private Route에 접근 허용.
