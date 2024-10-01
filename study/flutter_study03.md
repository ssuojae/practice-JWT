## static 메서드 사용을 지양해야하는 이유 (feat. Effective Dart)

### Static 지양하는 것을 권장하는 공식문서 주소
[https://dart.dev/effective-dart/design](https://dart.dev/effective-dart/design)<br/>
[https://dart.dev/tools/linter-rules/avoid_classes_with_only_static_members](https://dart.dev/tools/linter-rules/avoid_classes_with_only_static_members)<br/>

<br/>

### 1. **공식문서에서 Static을 지양하자고 주장하는 이유**

- Dart에서는 **탑 레벨 함수**를 사용할 수 있어, 클래스 내부에 불필요하게 `static` 메서드를 정의하는 것을 피할 수 있다. **Java**나 **C#**과 같은 언어는 모든 코드를 클래스 내부에 정의해야 하지만, Dart는 그럴 필요가 없다. 
- 클래스는 주로 **상태**와 **행동**을 관리하기 위한 것이며, `static` 메서드는 이러한 역할과는 맞지 않다. 따라서 상태와 관계없는 독립적인 작업을 처리하는 함수는 **탑 레벨 함수**로 정의하는 것이 더 적합하다.
- Dart는 **클래스 없이도 네임스페이스를 관리**할 수 있다. 여러 함수를 묶어서 네임스페이스처럼 관리하고 싶다면, Dart의 **라이브러리** 기능을 사용하면 된다. 이는 클래스에 의존할 필요 없이 함수들을 **import prefix**로 구분하여 사용할 수 있기 때문에, 굳이 클래스 내부에 `static` 메서드를 정의하는 복잡함을 줄일 수 있다.

예시:
```dart
// math_utils.dart
int add(int a, int b) => a + b;

// string_utils.dart
String capitalize(String input) => input.toUpperCase();
```

위의 파일들을 가져올 때:

```dart
import 'math_utils.dart' as math;
import 'string_utils.dart' as string;

void main() {
  print(math.add(5, 3)); // math 모듈의 add 함수 호출
  print(string.capitalize('hello')); // string 모듈의 capitalize 함수 호출
}
```

### 2. 객체 지향 철학과 어긋남
Dart에서 클래스는 상태와 행동을 결합하여 객체를 정의하는 도구이다. 하지만 static 메서드는 상태와 무관한 독립적인 함수이기 때문에, 이를 클래스로 감싸는 것은 객체 지향의 본질과 맞지 않는다. 만약 함수가 클래스의 상태에 의존하지 않고, 단순히 독립적인 작업을 수행한다면, 함수로 정의하는 것이 더 적합하다.

### 3. 클린 코드 원칙
static 메서드만 포함된 클래스는 코드 스멜로 간주될 수 있다. 클래스는 객체를 정의하기 위한 도구이므로, static 메서드만 있는 클래스는 불필요한 추상화를 만드는 결과를 초래한다. 이는 유지보수성을 저해하고, 코드의 직관성을 떨어뜨린다.

잘못된 예시:
```dart
class MathUtils {
  static int add(int a, int b) => a + b;
}

더 나은 예시:
int add(int a, int b) => a + b;
```
- 위의 두 코드에서 MathUtils 클래스는 불필요한 구조로, 단순히 함수를 탑 레벨로 정의하는 것이 더 간결하고 직관적이다.

### 프로젝트 코드 수정
- 상태와 관련 없는 함수는 굳이 클래스로 감싸지 않고 탑 레벨 함수로 정의하는 것이 Dart의 철학에 맞다.
- 기존 `UserMapper` 코드를 굳이 인스턴스없이 메서드 사용을 위해 Static 메서드로 정의했으나 위에서 언급한 이유로 리팩토링했다.

<br/>

```dart
// 리팩토링 이전 코드
// user_mapper.dart

// DTO -> Entity
static UserEntity toEntityFromDTO(UserDTO dto) {
  return UserEntity(
    uuid: dto.uuid,
    email: dto.email,
    password: dto.password,
  );
}

// Entity -> DTO
static UserDTO toDTOFromEntity(UserEntity entity) {
  return UserDTO(
    uuid: entity.uuid,
    email: entity.email,
    password: entity.password,
  );
}
...
```

```dart
// 리팩토링 이후
// user_mapper.dart

// DTO -> Entity
UserEntity toEntityFromDTO(UserDTO dto) {
  return UserEntity(
    uuid: dto.uuid,
    email: dto.email,
    password: dto.password,
  );
}

// Entity -> DTO
UserDTO toDTOFromEntity(UserEntity entity) {
  return UserDTO(
    uuid: entity.uuid,
    email: entity.email,
    password: entity.password,
  );
}
```
