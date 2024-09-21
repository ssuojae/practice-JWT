# PostgreSQL 연결 문제 트러블 슈팅

<br/>

## 문제 발생

<img width="700" alt="image" src="https://github.com/user-attachments/assets/07b17c4c-18c6-4988-a5ca-15df4174fbdb">

-  도커 환경에서 실행했을 때 `nestjs_app | Error: connect ECONNREFUSED 127.0.0.1:5432`  에러가 발생했다.

<br/>

## 문제 해결

- 문제의 원인은 database.config.ts 파일에서 PostgreSQL 호스트가 잘못 설정되어, **localhost(127.0.0.1)** 로 되어 있었다.
- 도커 환경에서는 **localhost(127.0.0.1)** 를 사용할 수 없기 때문에, PostgreSQL 컨테이너에 접근할 수 없었다. 즉 도커 내에서 각 서비스는 컨테이너 이름을 통해 접근해야 한다.

```typescript
// 잘못된 설정: localhost로 설정된 부분
export const typeOrmConfig: TypeOrmModuleOptions = {
  type: 'postgres',
  host: 'localhost',  // 잘못된 호스트 설정
  port: 5432,
  username: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  database: process.env.POSTGRES_DB,
  entities: [__dirname + '/../**/*.entity.{js,ts}'],
  synchronize: true,
};


// 올바른 설정: 도커 컨테이너 이름으로 설정
export const typeOrmConfig: TypeOrmModuleOptions = {
  type: 'postgres',
  host: 'nestjs_postgres',  // 올바른 호스트 설정 (컨테이너 이름)
  port: 5432,
  username: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  database: process.env.POSTGRES_DB,
  entities: [__dirname + '/../**/*.entity.{js,ts}'],
  synchronize: true,
};
```

<img width="700" alt="image" src="https://github.com/user-attachments/assets/4e2057dc-c34c-413e-8318-e1ad2d0d5dd6">
  
- 문제 해결을 위해 database.config.ts 파일에서 host 값을 컨테이너 이름으로 수정했다.

<br/>

## 번외: 도커의 ip주소는 왜 127.0.0.1 (localhost)이 아닐까?

도움받은 블로그: [https://shout-to-my-mae.tistory.com/402](https://shout-to-my-mae.tistory.com/402)

### 도커의 IP 주소는 왜 127.0.0.1 (localhost)이 아닐까?

- **로컬 시스템**에서 도커를 실행한다고 해서, 컨테이너 내부도 로컬과 동일한 네트워크를 공유하는 것은 아니다.
- 도커는 컨테이너마다 **독립적인 가상 네트워크**를 생성하여 **로컬 환경**과 **격리된** 공간에서 컨테이너가 실행된다.
- 컨테이너는 **고유의 IP 주소**를 할당받으며, 이 IP 주소는 **도커의 가상 네트워크** 안에서만 유효하다.

### 도커 컨테이너와 가상 환경

- 도커 컨테이너는 **로컬 시스템**에서 실행되지만, 컨테이너 내부는 **도커 엔진**에 의해 관리되는 **가상 네트워크**에 속한다.
- 이 **가상 네트워크**는 컨테이너가 서로 통신하거나, 필요할 경우 외부와 통신할 수 있게 해주지만, 로컬 시스템의 네트워크와는 별개의 환경이다.

### 컨테이너에 연결하는 방법

- 로컬 환경에서 도커 컨테이너에 연결하려면, **localhost**와 컨테이너에 매핑된 **포트 번호**를 이용해 연결할 수 있다.
- 중요한 점은, **컨테이너가 사용하는 포트**가 **호스트의 포트**와 **올바르게 매핑**되어야 한다.

### 요약
- 도커 컨테이너는 로컬 시스템과 독립된 가상 네트워크에서 실행된다.
- 컨테이너 내부는 로컬과 격리된 네트워크 환경을 가지고 있기 때문에, 127.0.0.1 대신 컨테이너의 IP 주소를 사용해야 한다.

