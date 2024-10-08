
### JWT 구현에서 Redis와 PostgreSQL을 사용한 이유

- 사실 JWT의 큰 장점 중 하나는 서버에 상태를 저장할 필요가 없다는 것이다.
- JWT는 기본적으로 서버가 클라이언트의 세션 정보를 유지하지 않고도 인증이 가능하다는 점에서 매우 효율적이다. (Stateless)
- 그럼에도 불구하고 내가 PostgreSQL과 Redis를 추가한 이유는 JWT만으로 해결할 수 없는 몇 가지 실무적인 문제를 효율적으로 해결하기 위해서이다. 

<br/>

#### 1. PostgreSQL 사용 이유

- **데이터 영속성**: 
  JWT는 클라이언트 측에서 토큰을 관리하는 방식이지만, 유저 정보, 인증 기록 등 **중요한 데이터**는 영구적으로 저장할 필요가 있다. **PostgreSQL**은 관계형 데이터베이스로써 **데이터 무결성**과 **복잡한 쿼리 처리**가 뛰어나기 때문에, 유저 정보와 같은 중요한 데이터를 관리하는 데 적합하다.
  
- **스키마 관리**: 
  JWT와 함께 사용할 **유저 테이블**, **권한 테이블** 등의 관계형 데이터를 정의하고 관리하는데, PostgreSQL은 뛰어난 성능을 발휘한다. 특히 데이터의 구조가 명확하고, 쿼리 성능이 중요한 경우에 적합하다.

#### 2. Redis 사용 이유

- **세션 관리**:
  JWT는 기본적으로 **stateless** 하지만, **Refresh Token**이나 **로그아웃 처리** 등에서 상태를 관리할 필요가 있다. Redis는 **메모리 기반의 빠른 데이터 저장소**로, 세션 관리와 같은 **짧은 시간 동안 유지되는 데이터**를 관리하는 데 적합하다.
  
- **Refresh Token 관리**: 
  JWT가 만료된 후 **새로운 Access Token**을 발급하기 위해서는 Refresh Token을 검증해야 하는데, 이 때 Redis에 저장된 Refresh Token을 확인. Redis는 **빠르고 가벼운** 접근 속도를 제공하기 때문에, 토큰 검증에 유용하다.

- **블랙리스트 처리**:
  사용자가 로그아웃을 하거나 보안 이슈가 발생했을 때, JWT를 바로 무효화하는 방법으로 **JWT 블랙리스트**를 사용할 수 있다. Redis는 이 블랙리스트를 관리하기에 최적화된 도구로 클라이언트에서 오는 모든 JWT를 Redis에 저장된 블랙리스트와 비교하여 차단할 수 있다.

#### 3. Redis와 PostgreSQL의 상호 보완적 역할

- **PostgreSQL**은 중요한 유저 데이터를 **영구적으로 저장**하는 역할을 담당하고, **Redis**는 **빠르게 접근할 수 있는 임시 데이터**나 **실시간 데이터**(세션, 토큰 등)를 관리한다. 이를 통해 JWT 인증 시스템에서 **안정성과 성능**을 모두 확보할 수 있다.

- 이 두 시스템을 결합함으로써, PostgreSQL의 **안정성**과 Redis의 **속도**를 함께 활용해 확장성 있는 JWT 인증 시스템을 구현할 수 있다.
