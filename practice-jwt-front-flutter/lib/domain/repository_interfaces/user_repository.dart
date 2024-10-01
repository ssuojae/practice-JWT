import 'package:portfolio/domain/entities/user_entity.dart';

abstract interface class IUserRepository {
  Future<UserEntity> registerUser(String email, String password);

  Future<UserEntity> loginUser(String email, String password);

  Future<String> refreshToken(String refreshToken);

  Future<void> logoutUser();
}
