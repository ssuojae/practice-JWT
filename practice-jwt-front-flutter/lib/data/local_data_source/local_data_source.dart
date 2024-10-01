import 'package:portfolio/data/dao/user_dao.dart';
import 'package:portfolio/data/local_data_source/secure_token_service.dart';

final class LocalDataSource {
  final SecureTokenService _secureTokenService;

  LocalDataSource(this._secureTokenService);

  // 유저 정보를 로컬 저장소에 저장하는 메서드
  Future<void> saveUserOnfo(UserDAO userDAO) async {
    await _secureTokenService.saveAccessToken(userDAO.uuid);
  }

  // 로컬에서 유저 정보 불러오기
  Future<String?> getUserInfo() async {
    return await _secureTokenService.getAccessToken();
  }

  // 로그아웃 시 로컬 정보 삭제
  Future<void> clearUserInfo() async {
    await _secureTokenService.deleteAllToken();
  }
}