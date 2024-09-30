import 'package:portfolio/data/dto/user_dto.dart';
import 'package:portfolio/domain/user_entity.dart';

final class UserMapper {
  static UserEntity toEntityFromDTO(UserDTO dto) {
    return UserEntity(email: dto.email, password: dto.password);
  }

  static UserDTO toDTOFromEntity(UserEntity entity) {
    return UserDTO(email: entity.email, password: entity.password);
  }
}