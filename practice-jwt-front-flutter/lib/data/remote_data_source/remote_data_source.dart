import 'package:dio/dio.dart';
import 'package:portfolio/data/remote_data_source/user_api_service.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'dto/user_dto.dart';

final class RemoteDataSource {
  final UserApiService _userApiService;

  RemoteDataSource(this._userApiService);

  // 회원 가입
  Future<UserDTO> registerUser(String email, String password) async {
    try {
      Response response = await _userApiService.register(email, password);
      //서버로 부터 받은 데이터를 DTO로 변환
      return UserDTO.fromJson(response.data);
    } catch (error) {
      throw Exception('회원가입 실패: $error');
    }
  }

  // 로그인
  Future<UserDTO> loginUser(String email, String password) async {
    try {
      Response response = await _userApiService.login(email, password);
      return UserDTO.fromJson(response.data);
    } catch (error) {
      throw Exception('로그인 실패: $error');
    }
  }

  // 토큰 갱신
  Future<String> refreshToken(String refreshToken) async {
    try {
      Response response = await _userApiService.refreshToken(refreshToken);
      return response.data[AppStrings.accessTokenKey];
    } catch (error) {
      throw Exception('토큰 갱신 실패: $error');
    }
  }

  Future<void> accessProtectedResource() async {
    try {
      Response response = await _userApiService.accessProtectedResource();
      print('자동 로그인 성공: ${response.data}');
    } catch (error) {
      throw Exception('자동로그인 실패: $error');
    }
  }
}