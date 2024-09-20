# JWT RESTful API 엔드포인트

<br/>

## 1. 회원가입 (Register)

- **HTTP 메서드**: `POST`
- **엔드포인트**: `/auth/register`
- **설명**: 사용자가 이메일과 비밀번호로 회원가입 진행
- **Request Body**:
    ```json
    {
      "email": "user@example.com",
      "password": "password123"
    }
    ```
- **Response**: 성공적으로 회원가입이 완료되면, **JWT Access Token**과 **Refresh Token** 발급
    ```json
    {
      "accessToken": "jwt_access_token",
      "refreshToken": "jwt_refresh_token"
    }
    ```

## 2. 로그인 (Login)

- **HTTP 메서드**: `POST`
- **엔드포인트**: `/auth/login`
- **설명**: 사용자는 이메일과 비밀번호로 로그인
- **Request Header**:
    ```text
    Authorization: Basic {base64_encoded(email:password)}
    ```
- **Response**: 인증이 성공적으로 완료되면 **Access Token**과 **Refresh Token** 발급
    ```json
    {
      "accessToken": "jwt_access_token",
      "refreshToken": "jwt_refresh_token"
    }
    ```

## 3. Access Token 재발급 (Refresh Access Token)

- **HTTP 메서드**: `POST`
- **엔드포인트**: `/auth/token/refresh`
- **설명**: **Refresh Token**을 사용해 새로운 **Access Token** 발급
- **Request Body**:
    ```json
    {
      "refreshToken": "jwt_refresh_token"
    }
    ```
- **Response**: 새로 발급된 **Access Token** 반환.
    ```json
    {
      "accessToken": "new_jwt_access_token"
    }
    ```

## 4. Private Route (Protected Resource Access)

- **HTTP 메서드**: `GET`
- **엔드포인트**: `/protected/resource`
- **설명**: 사용자가 **Access Token**을 사용해 접근하는 **Private Route**.
- **Request Header**:
    ```text
    Authorization: Bearer {accessToken}
    ```
- **Response**: 보호된 리소스에 접근이 허용되면 해당 데이터를 반환.
    ```json
    {
      "data": "private_data"
    }
    ```

