import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:portfolio/domain/user_entity.dart';

import '../../../utils/app_strings.dart';

final class UserDao {
  final FlutterSecureStorage _secureStorage;

  UserDao(this._secureStorage);

  // 유저 정보 저장 (캐싱) 메서드
  Future<void> cacheUser(UserEntity user) async {
    await _secureStorage.write(key: AppStrings.emailKey, value: user.email);
    await _secureStorage.write(key: AppStrings.passwordKey, value: user.password);
  }

  // 캐싱된 유저 정보 가져 오는 메서드
  Future<UserEntity?> getCachedUser() async {
    final email = await _secureStorage.read(key: AppStrings.emailKey);
    final password = await _secureStorage.read(key: AppStrings.passwordKey);

    if (email != null && password != null) {
      return UserEntity(email: email, password: password);
    }
    return null; // 캐싱된 유저가 없을 때는 null 변환
  }

  // 캐싱된 유저 정보를 삭제하는 메서드
  Future<void> clearCachedUser() async {
    await _secureStorage.delete(key: AppStrings.emailKey);
    await _secureStorage.delete(key: AppStrings.passwordKey);
  }
}