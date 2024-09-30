## Flutter에서 DAO는 freezed를 사용하지 않고 DTO에서 freezed를 사용하는 이유 (feat. mutable, immutable)

<br/>

- Flutter에서 개발을 진행하면서 데이터 계층의 설계에 대해 고민할 때, 종종 freezed 패키지를 어떻게 활용할지 결정해야 한다. 
- 특히 DTO(Data Transfer Object)와 DAO(Data Access Object)를 정의할 때, mutable하게 선언할지 immutable하게 선언해야할지 고민을 했고 애플 공식문서를 참조하여 프로젝트를 진행했다.
- 공식문서 주소: [https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes)

<br/>

### freezed의 역할
- freezed는 불변 객체(immutable object)를 생성하는 데 유용한 패키지이다.
- Dart에서는 객체가 불변일 때, 즉 상태가 변경되지 않을 때 코드의 예측 가능성이 높아지고 버그를 줄일 수 있다.
- freezed는 이러한 불변 객체를 쉽게 만들 수 있도록 돕는 도구이다. 불변 객체는 보통 데이터 전송 객체(예: DTO)에서 사용되며, 값이 변경되지 않아야 하는 상황에서 적합하다.

<br/>

### DAO와 DTO의 차이
#### DTO (Data Transfer Object)
- DTO는 데이터를 전송하는 역할을 한다. 주로 API 호출 시 서버와의 통신에 사용되며, 서버에서 받은 데이터를 객체로 변환하거나, 반대로 서버로 데이터를 전송할 때 객체를 JSON 형식으로 변환하는 역할을 담당한다.
- DTO는 데이터를 표현하기만 할 뿐, 상태가 변경되지 않는 것이 일반적이다. 예를 들어, 서버로부터 받은 사용자 정보는 클라이언트에서 수정할 일이 거의 없기 때문에, DTO는 불변 객체로 처리하는 것이 적합하다.
- 따라서 DTO에서 freezed를 사용하여 데이터를 불변 객체로 관리하면, 상태 변화를 방지하고 데이터 무결성을 유지할 수 있다.

```dart
@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    required String email,
    required String username,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);
}
```
<br/>

#### DAO (Data Access Object)
- DAO는 데이터를 저장하고 관리하는 역할을 한다. 보통 데이터베이스나 로컬 스토리지와 상호작용하여 데이터를 저장, 읽기, 수정, 삭제하는 CRUD 작업을 수행한다.
- 이 과정에서 데이터의 상태가 변경될 수 있다. 예를 들어, 앱에서 캐싱된 데이터를 업데이트하거나 새로운 데이터를 삽입할 때 DAO는 데이터를 변경할 수 있어야 한다.
- 따라서 DAO는 상태가 변경될 가능성이 있는 객체로, 불변성을 고집할 필요가 없다. 오히려 데이터를 효율적으로 읽고 쓰기 위해 상태 변경이 필요한 객체로 구현해야 한다. DAO에서 freezed를 사용하지 않는 이유는 바로 이 때문이다.

```dart
import 'package:json_annotation/json_annotation.dart';

part 'user_dao.g.dart';

@JsonSerializable()
class UserDAO {
  String email;
  String password;

  UserDAO({
    required this.email,
    required this.password,
  });

  // fromJson 메서드 (역직렬화)
  factory UserDAO.fromJson(Map<String, dynamic> json) => _$UserDAOFromJson(json);

  // toJson 메서드 (직렬화)
  Map<String, dynamic> toJson() => _$UserDAOToJson(this);
}
```
- 위 예시처럼 DAO는 데이터를 읽고 쓰기 위해 상태를 변경해야 한다.
- 이러한 상황에서 freezed를 사용하게 되면 상태를 불변으로 만들어 데이터 저장이나 수정 작업이 불가능해지므로, DAO에서는 freezed를 사용하지 않는 것이 적합하다.

### 정리
- DTO는 서버와의 통신을 위한 불변 데이터 객체이므로, freezed를 사용하여 데이터의 무결성을 유지하는 것이 적합하다.
- DAO는 데이터베이스와 상호작용하여 상태를 변경할 수 있는 객체이므로, 상태 변경이 가능한 객체로 설계하는 것이 필요하다. 따라서 freezed를 사용하지 않고, 데이터를 읽고 쓰는 방식으로 구현하는 것이 적합하다.
- Flutter에서 DTO와 DAO를 설계할 때, 각자의 역할과 상태 관리 방식을 고려하여 freezed의 사용 여부를 결정하는 것이 중요하다.
