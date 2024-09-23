## TypeOrmModule의 `forRoot()`와 `forFeature()`

<br/>

### 1. `forRoot()`

- `TypeOrmModule.forRoot()`는 애플리케이션의 **데이터베이스 연결 설정**을 담당하는 메서드이다.
- 애플리케이션이 실행될 때 **한 번만 설정**되며, **전역에서 공유**되어 여러 모듈이 동일한 DB 연결을 사용할 수 있게 한다.
- 데이터베이스 연결 설정은 애플리케이션 전체에서 동일해야 하며, 각 모듈이 다른 DB 연결을 사용하지 않도록 **중앙에서 관리**되는 것이 효율적이다.
- 만약, 이 설정을 여러 곳에서 반복적으로 한다면 데이터베이스 연결 설정이 일관되지 않을 수 있다는 문제가 발생한다.

#### 프로젝트 코드:
```typescript
// auth.module.ts
@Module({
  imports: [
    TypeOrmModule.forRoot(typeOrmConfig),
    ...
  ],
  ...

// database.config.ts
TypeOrmModule.forRoot({
  type: 'postgres',
  host: 'localhost',
  port: 5432,
  username: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  database: process.env.POSTGRES_DB,
  entities: [__dirname + '/../**/*.entity.{js,ts}'],
  synchronize: true,
})
```

<br/>

### 2. `forFeature()`

- `TypeOrmModule.forFeature()`는 특정 엔티티에 대해 해당 모듈에서 사용할 레포지토리를 설정하는 메서드이다.
- 모듈별로 필요한 엔티티만 등록하여 각 모듈이 자신에게 필요한 레포지토리를 사용할 수 있게 한다.
- 모든 모듈에서 동일한 레포지토리나 엔티티가 필요한 것이 아니기 때문에, 모듈 단위로 엔티티를 관리하는 것이 효율적이다.
- 이를 통해 불필요한 레포지토리 등록을 방지하고, 모듈 간 의존성을 줄일 수 있다.

프로젝트 코드:

```typescript
TypeOrmModule.forFeature([UserEntity])
```
- iOS나 Flutter를 하다온 입장에서 솔직히 이부분이 이해가 안갔다. 모델이 필요한 객체만 알면되는데 왜 굳이 모듈에서 주입을 해주어야하는지가 낯선 부분이였다. 
- 알고보니 의존성 주입과 모듈 간 독립성을 중시하는 프레임워크라서, 모듈에서 필요한 의존성을 명시적으로 선언하는 방식을 선호하기 때문에 위와 같이 forFeature로 주입을 해야했다.
- 정리하자면 플러터랑 비교했을 때 forRoot는 레이지싱글톤 주입, forFeature는 주입할 때마다 인스턴스를  새로 만드는 방식이고 nestjs 특성상 모듈에서 이와같은 의존성 주입관계를 명시해주어야한다.
