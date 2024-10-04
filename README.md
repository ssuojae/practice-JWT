# JSON Web Token 프로젝트 

<img src="https://github.com/user-attachments/assets/ae73db44-dad4-49d4-a0d8-76a0fee1392e" width="500">

<br/>
<br/>

## 백엔드 - Node.js

### 구조 설계

<img width="1239" alt="image" src="https://github.com/user-attachments/assets/be6c2416-52de-448d-b7e9-353641f15345">


### 시퀀스 다이어그램

#### 회원가입 플로우
<img width="930" alt="image" src="https://github.com/user-attachments/assets/91beb1f1-186f-4cf1-8b4b-d73557e8748c">

<br/>

#### 로그인 플로우
<img width="930" alt="image" src="https://github.com/user-attachments/assets/d54ed0f1-e62f-4392-9f49-ff2e67c936f6">

<br/>

#### 자동 로그인 플로우

<img width="730" alt="image" src="https://github.com/user-attachments/assets/30f250c0-33b8-4275-93f5-607cda7c9199">


<br/>
<br/>

### RESTful API 엔드포인트 설계

#### [API 문서로 이동하기](https://app.swaggerhub.com/apis-docs/SUOJAE3/jwt/1.0.0#/default/post_auth_login)

<br/>
<br/>

## 프론트 - Flutter

### 구조 설계

<img src="https://github.com/user-attachments/assets/7b1e23dd-25a3-46f7-aa4a-ccfe30ca386a" width="700">

### 시퀀스 다이어그램

#### 회원가입 플로우

<img src="https://github.com/user-attachments/assets/c38d20fc-1acd-49c5-bf23-dcd0c46e1823" width="700">

<br/>

#### 로그인 플로우

<img width="700" alt="image" src="https://github.com/user-attachments/assets/ebab636f-4f2a-4bb9-b79d-0e6a1cd6910d">


<br/>

#### 토큰 갱신 플로우 

<img src="https://github.com/user-attachments/assets/a2829699-3485-4274-b614-cd3bc5155106" width="700">

<br/>
<br/>


## 프론트 - iOS

### 구조 설계

![image](https://github.com/user-attachments/assets/146e8caf-3dcf-4149-9f7d-48fc4d98be49)


<br/>
<br/>

## 공부기록

### 백엔드

- [JWT 구현에서 Redis와 PostgreSQL을 사용한 이유](https://github.com/ssuojae/practice-JWT/blob/main/study/study2.md)
- [인증과 인가, JWT와 Session의 차이](https://github.com/ssuojae/practice-JWT/blob/main/study/study1.md)
- [JWT 인코딩과 디코딩 원리](https://github.com/ssuojae/practice-jwt/blob/main/study/study3.md)
- [Access Token vs Refresh Token](https://github.com/ssuojae/practice-jwt/blob/main/study/study4.md)
- [왜 Redis는 빠를까?](https://github.com/ssuojae/practice-JWT/blob/main/study/study5.md)
- [비밀번호 암호화 비교 및 bcrypt 도입 이유](https://github.com/ssuojae/practice-jwt/blob/main/study/study6.md)
- [Docker를 이용한 개발 환경 설정](https://github.com/ssuojae/practice-jwt/blob/main/study/study7.md#docker%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-%EA%B0%9C%EB%B0%9C-%ED%99%98%EA%B2%BD-%EC%84%A4%EC%A0%95%20Docker%EB%A5%BC%20%EC%9D%B4%EC%9A%A9%ED%95%9C%20%EA%B0%9C%EB%B0%9C%20%ED%99%98%EA%B2%BD%20%EC%84%A4%EC%A0%95)
- [도커의 ip주소는 왜 127.0.0.1 이 아닐까?](https://github.com/ssuojae/practice-jwt/blob/main/study/trouble_shooting01.md)
- [TypeOrmModule의 `forRoot()`와 `forFeature()`](https://github.com/ssuojae/practice-JWT/blob/main/study/study8.md)
- [`@InjectRepository` 대신 `@Inject`를 사용한 이유](https://github.com/ssuojae/practice-JWT/blob/main/study/study9.md)
- [JWT 기반 자동 로그인 구현 (Private Route 설정)](https://github.com/ssuojae/practice-JWT/blob/main/study/study10.md)
- [DTO에서 PickType과 데코레이터 적용](https://github.com/ssuojae/practice-JWT/blob/main/study/study11.md)


<br/>

### 프론트엔드

- [Flutter에서 DAO는 freezed를 사용하지 않고 DTO에서 freezed를 사용한 이유 (feat. mutable, immutable)](https://github.com/ssuojae/practice-JWT/blob/main/study/flutter_study01.md)
- [프론트와 백엔드 간 유저 정보 관리 전략](https://github.com/ssuojae/practice-JWT/blob/main/study/flutter_study02.md)
- [static 메서드 사용을 지양해야하는 이유 (feat. Effective Dart)](https://github.com/ssuojae/practice-JWT/blob/main/study/flutter_study03.md)
- [JWT토큰 관리에 있어서 Keychain을 사용한 이유](https://github.com/ssuojae/practice-JWT/blob/main/study/ios_study01.md)

