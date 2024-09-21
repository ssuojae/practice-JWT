## Docker를 이용한 개발 환경 설정

<br/>

### 개요

NestJS 기반의 백엔드 프로젝트에서 **PostgreSQL**, **Redis**, **bcrypt**, **JWT** 같은 필수적인 서비스들을 도커(Docker)와 도커 컴포즈(Docker Compose)를 통해 컨테이너로 설정하여 재사용 가능하게 만들었다. 각 서비스를 도커로 관리함으로써, 매번 복잡한 설정 없이 일관된 환경을 유지할 수 있게 했다.

<br/>

#


### 고민한 사항과 선택 이유

#### 1. **로컬 설치 vs Docker 사용**
처음에는 PostgreSQL과 Redis를 로컬에 설치해서 사용할지 고민했으나, 많은 디펜던시 걸려있는 nodejs 특성상 협업할 경우 프로젝트에서의 환경 설정 충돌과 관리의 복잡성을 겪을거라 생각했다. 이를 해결하기 위해, 모든 의존성을 **Docker**로 컨테이너화하여 문제를 해결했다.

#### 2. **환경 변수 관리**
도커를 사용하면서 중요한 정보를 하드코딩하지 않기 위해, **dotenv**와 **Docker Compose**의 환경 변수를 통해 관리했다. 이를 통해 보안성을 유지하면서도, 설정 파일을 통해 간편하게 관리할 수 있었다.

#### 3. **빠른 테스트 및 재사용성**
도커 컨테이너를 사용하면, **테스트**를 할 때 일관된 환경을 제공받을 수 있기 때문에 테스트 결과의 신뢰성을 높일 수 있다. 특히 다음과 같은 이유로 테스트와 관련이 있다

   -> **일관된 환경 제공** <br/>
   도커를 통해 동일한 PostgreSQL, Redis 설정을 재사용할 수 있기 때문에, 각기 다른 개발 환경에서도 **일관된 테스트 환경**을 보장할 수 있다. 이는 설정 오류로 인한 예기치 않은 에러를 방지하고, 동일한 테스트 결과를 기대할 수 있게 한다. <br/>

  -> **빠른 초기화**  <br/>
   테스트 중 데이터베이스나 캐시를 초기화하는 경우가 자주 발생하는데, 도커 컨테이너는 독립적인 환경을 제공하므로, 쉽게 초기화 후 테스트를 다시 실행할 수 있다. 이를 통해 매번 새로운 상태에서 **테스트를 빠르게** 진행할 수 있다.<br/>

#### 4. PostgreSQL과 Redis 설정

```yaml
services:
  app:
    build: .
    volumes:
      - .:/usr/src/app  # 프로젝트 소스를 컨테이너로 마운트
      - /usr/src/app/node_modules  # node_modules는 도커 내부에서만 관리

  postgres:
    image: postgres:16
    environment:
      POSTGRES_USER: ${POSTGRES_USER}  # 환경 변수를 통해 유저명 설정
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}  # 환경 변수를 통해 비밀번호 설정
      POSTGRES_DB: ${POSTGRES_DB}  # 환경 변수를 통해 DB 이름 설정
    volumes:
      - ./postgres_data:/var/lib/postgresql/data  # 루트 디렉토리에 데이터 저장

  redis:
    image: redis:alpine
    volumes:
      - ./redis_data:/data  # 루트 디렉토리에 데이터 저장

   ...
```

- Docker Compose를 통해 PostgreSQL과 Redis 컨테이너를 설정하고, 데이터 저장을 위한 볼륨을 루트 디렉토리에 설정했다.
- 각각의 서비스가 독립적으로 실행되며, 설정된 환경 변수를 사용하여 서버가 쉽게 재실행 가능하도록 했다.
- node_modules는 도커 내부에서만 관리하여 로컬과의 충돌을 방지했다.

