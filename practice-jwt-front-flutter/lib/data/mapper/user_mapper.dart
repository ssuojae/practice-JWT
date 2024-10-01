import '../../domain/user_entity.dart';
import '../local_data_source/dao/user_dao.dart';
import '../remote_data_source/dto/user_dto.dart';

final class UserMapper {

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

  // DAO -> Entity
  static UserEntity toEntityFromDAO(UserDAO dao) {
    return UserEntity(
      uuid: dao.uuid,
      email: dao.email,
      password: dao.password,
    );
  }

  // Entity -> DAO
  static UserDAO toDAOFromEntity(UserEntity entity) {
    return UserDAO(
      uuid: entity.uuid,
      email: entity.email,
      password: entity.password,
    );
  }
}