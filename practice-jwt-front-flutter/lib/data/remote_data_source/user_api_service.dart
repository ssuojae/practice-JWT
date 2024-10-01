import 'package:dio/dio.dart';
import 'package:portfolio/data/remote_data_source/api_endpoints.dart';
import 'package:portfolio/data/remote_data_source/dio_service.dart';

final class UserApiService {
  final DioService _dioService;

  UserApiService(this._dioService);

  // 회원가입 요청
  Future<Response> register(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };
    return await _dioService.dio.post(ApiEndpoints.register, data: data);
  }

  // 로그인 요청
  Future<Response> login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };
    return await _dioService.dio.post(ApiEndpoints.login, data: data);
  }

  // 토큰 갱신 요청
  Future<Response> refreshToken(String refreshToken) async {
    final data = {
      'refresToken': refreshToken,
    };
    return await _dioService.dio.post(ApiEndpoints.refreshToken, data: data);
  }

  // 자동로그인
  Future<Response> accessProtectedResource() async {
    return await _dioService.dio.get(ApiEndpoints.protectedResource);
  }
}
