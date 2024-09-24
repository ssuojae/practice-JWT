## JWT 기반 자동 로그인 및 Private Route 설정

### 1. 고민하게 된 계기
- JWT는 사용자의 로그인 상태를 유지할 수 있는 유용한 방식이다. 사용자는 로그인 시 Access Token과 Refresh Token을 발급받고, 이를 통해 인증 상태를 유지한다.
- 이 프로젝트에서 JWT를 활용하여 인증 상태를 유지하면서, 로그인 후 인증된 사용자만 보호된 리소스에 접근할 수 있도록 구성하였다.

<br/>

### 2. 문제 해결 과정

#### 2.1 JWT 토큰의 활용
- `passport-jwt`를 활용하여 JWT 토큰을 검증하고, 사용자가 인증된 상태에서만 Private Route에 접근할 수 있도록 설정하였다.

#### 2.2 Private Route (Protected Resource Access)
- Private Route는 인증된 사용자만이 접근할 수 있는 보호된 경로이다.
- 이를 구현하기 위해, NestJS에서는 `passport-jwt`를 사용하여 `JwtAuthGuard`를 설정하고, JWT 토큰을 검증하는 과정을 자동화하였다.

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

#### 2.3 자동 로그인 구현
자동 로그인 흐름은 다음과 같다:

- 로그인 후 클라이언트에 JWT 토큰 저장.
- 클라이언트가 앱을 재접속할 때, 저장된 토큰을 Authorization 헤더에 담아 요청.
- 서버에서 JwtAuthGuard를 사용해 토큰을 검증한 후, 유효한 경우 인증된 사용자로 처리하여 Private Route에 접근을 허용한다.
- 자동 로그인은 클라이언트가 서버에 요청할 때마다 JWT 토큰을 자동으로 포함시켜서 처리된다.
