## `@InjectRepository` 대신 `@Inject`를 사용한 이유

<br/>

### 1. 문제가 떠오른 계기
프로젝트에서 TypeORM을 사용하면서, 데이터베이스 레포지토리를 주입하기 위해 **`@InjectRepository()`** 데코레이터를 사용해 레포지토리 객체를 생성하고 주입하는 방식을 고려했다. 그러나 **특정 ORM(TypeORM)에 강하게 의존하는 구조**는 나중에 다른 ORM이나 데이터베이스를 사용하는 상황에서 유연성이 떨어질 수 있다는 생각이 들었다.

<br/>

### 2. 고민한 부분

TypeORM에 의존하는 방식은 다음과 같은 문제를 야기할 수 있었다
- **프레임워크 종속성**: `@InjectRepository()`를 사용하면, 코드가 TypeORM에 강하게 결합되어 **다른 ORM이나 데이터베이스로 전환할 때**  코드 수정이 복잡해진다.

<br/>

### 3. 해결 방법: 인터페이스와 `@Inject()`를 통한 의존성 주입

이 문제를 해결하기 위해, **인터페이스 기반의 의존성 주입**을 선택했다. **`@InjectRepository()`** 대신 **`@Inject()`** 를 사용하여 **인터페이스에 의존**하도록 설계를 변경함으로써, 프로젝트가 특정 ORM이나 데이터베이스에 결합되지 않도록 했다.

#### 인터페이스 기반 의존성 주입의 장점
- **유연성 확보**: TypeORM이 아닌 다른 ORM(Mongoose, Sequelize 등)으로 전환할 때도 인터페이스는 그대로 유지하고, 구현체만 교체하면 되므로 코드 수정이 최소화된다.
- **확장성**: 데이터베이스나 ORM 변경 시, 기존 비즈니스 로직 코드에 대한 수정 없이 구현체만 교체 가능하다.
- **테스트 용이성**: 인터페이스에 의존하기 때문에 테스트 시 **mock 객체**로 구현체를 쉽게 대체할 수 있다.

<br/>

### 4. 적용 방법


1. **`@Inject()`를 통한 인터페이스 주입**:
    - `AuthService`와 같은 서비스에서는 **구체적인 구현체**가 아닌, **인터페이스**에 의존하도록 수정했다.

    ```typescript
    @Injectable()
    export class AuthService implements IAuthService {
      constructor(
        @Inject('IUserRepository') // 인터페이스에 의존
        private readonly userRepository: IUserRepository,
        private readonly jwtService: IJwtService,
        private readonly redisService: IRedisService,
      ) {}
    }
    ```

2. **모듈에서 구현체를 주입**:
    - 모듈에서는 **인터페이스와 구현체를 바인딩**하여, 필요한 구현체를 주입한다. 이렇게 하면 ORM이나 데이터베이스가 변경될 때도, 해당 모듈에서만 구현체를 변경해주면 된다.

    ```typescript
    @Module({
      providers: [
        {
          provide: 'IUserRepository',
          useClass: TypeOrmUserRepository, // TypeORM 기반 구현체 주입
        },
        AuthService,
      ],
      exports: ['IUserRepository'],
    })
    export class AuthModule {}
    ```
<br/>

`@InjectRepository()` 대신 `@Inject()`와 **인터페이스 기반 의존성 주입**을 사용함으로써:
- 프로젝트가 **특정 ORM(TypeORM)에 종속**되지 않고, 
- 다른 ORM으로의 전환 및 데이터베이스 변경 시 **유연성과 확장성**을 유지할 수 있다.
- 또한, 테스트 시 **mock 객체**를 주입하여 더 쉽게 **단위 테스트**를 진행할 수 있는 구조로 개선되었다.

이러한 설계를 통해 장기적으로 **유연한 아키텍처**를 구축할 수 있었고, ORM이나 데이터베이스 변경이 필요한 상황에서도 최소한의 코드 수정만으로 대처할 수 있는 기반을 마련했다.

<br/>

### 총정리: `@Inject()`와 `@InjectRepository()`의 차이

프로젝트에서 **`@Inject()`** 를 사용해 인터페이스 기반의 의존성 주입을 선택한 이유는, **`@Inject()`** 가 TypeORM과는 무관한 **NestJS의 일반적인 의존성 주입 데코레이터**이기 때문이다. 이와 달리, **`@InjectRepository()`** 는 TypeORM에서 제공하는 레포지토리 주입을 위한 데코레이터로, TypeORM에 강하게 결합된 방식이다.

- **`@Inject()`**: NestJS의 **의존성 주입** 시스템에서 사용되는 일반적인 데코레이터로, 인터페이스나 토큰을 통해 구체적인 클래스를 주입할 수 있다. **TypeORM과는 무관**하며, 다양한 상황에서 사용 가능하다.
- **`@InjectRepository()`**: **TypeORM 전용 데코레이터**로, TypeORM에서 제공하는 **레포지토리 객체**를 주입하기 위한 용도로 사용된다. 이는 TypeORM과의 강한 결합을 의미하며, 다른 ORM을 사용하거나 변경할 때 제약이 될 수 있다.

따라서, **`@Inject()`** 를 사용해 의존성을 주입함으로써, 프로젝트가 특정 ORM에 종속되지 않고 유연성을 유지할 수 있다.
