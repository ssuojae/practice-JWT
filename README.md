
# Practice JWT

<br/>

## 백엔드 - NestJS

### 구조 설계

<img width="1200" alt="image" src="https://github.com/user-attachments/assets/e89a5090-0c1e-4124-9e4b-a67263eaa637">


### 시퀀스 다이어그램

<img width="600" alt="image" src="https://github.com/user-attachments/assets/3660ec1f-9b4f-4f25-a341-44f3c4128731">

<br/>
<br/>

### RESTful API 엔드포인트 설계

#### 1. 회원가입 (Register)

- **HTTP 메서드**: `POST`
- **엔드포인트**: `/auth/register`
- **설명**: 사용자가 이메일과 비밀번호로 회원가입을 진행.
- **Request Body**:
    ```json
    {
      "email": "user@example.com",
      "password": "password123"
    }
    ```
- **Response**: 성공적으로 회원가입이 완료되면, **JWT Access Token**과 **Refresh Token**을 발급
    ```json
    {
      "accessToken": "jwt_access_token",
      "refreshToken": "jwt_refresh_token"
    }
    ```

#### 2. 로그인 (Login)

- **HTTP 메서드**: `POST`
- **엔드포인트**: `/auth/login`
- **설명**: 사용자가 이메일과 비밀번호로 로그인합니다. **Basic 인증** 방식으로 `Base64` 인코딩된 이메일과 비밀번호를 전송
- **Request Header**:
    ```text
    Authorization: Basic {base64_encoded(email:password)}
    ```
- **Response**: 인증이 성공적으로 완료되면 **Access Token**과 **Refresh Token**을 발급받음
    ```json
    {
      "accessToken": "jwt_access_token",
      "refreshToken": "jwt_refresh_token"
    }
    ```

#### 3. Access Token 재발급 (Refresh Access Token)

- **HTTP 메서드**: `POST`
- **엔드포인트**: `/auth/token/refresh`
- **설명**: **Refresh Token**을 사용해 새로운 **Access Token**을 발급받음
- **Request Body**:
    ```json
    {
      "refreshToken": "jwt_refresh_token"
    }
    ```
- **Response**: 새로 발급된 **Access Token** 반환,
    ```json
    {
      "accessToken": "new_jwt_access_token"
    }
    ```

#### 4. Private Route (Protected Resource Access)

- **HTTP 메서드**: `GET`
- **엔드포인트**: `/protected/resource`
- **설명**: 사용자가 **Access Token**을 사용해 접근하는 **Private Route**. 보호된 데이터를 요청할 때는 **Bearer 토큰**을 사용함
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

<br/>
<br/>

## 프론트 - Flutter

### 구조 설계
### 시퀀스 다이어그램

<br/>
<br/>


## 프론트 - iOS

### 구조 설계
### 시퀀스 다이어그램


<br/>
<br/>

## 공부기록

- [JWT 구현에서 Redis와 PostgreSQL을 사용한 이유](https://github.com/ssuojae/practice-jwt/blob/main/%08study2.md)
- [인증과 인가, JWT와 Session의 차이](https://github.com/ssuojae/practice-jwt/blob/main/study1.md)
- [JWT 인코딩과 디코딩 원리](https://github.com/ssuojae/practice-jwt/blob/main/study3.md)
- [Access Token vs Refresh Token](https://github.com/ssuojae/practice-jwt/blob/main/study4.md)
- [왜 Redis는 빠를까?](https://github.com/ssuojae/practice-jwt/blob/main/%08study5.md)
