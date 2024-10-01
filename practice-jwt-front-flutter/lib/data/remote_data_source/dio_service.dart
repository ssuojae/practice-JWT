import 'package:dio/dio.dart';
import '../local_data_source/secure_token_service.dart';
import 'api_endpoints.dart';

class DioService {
  final Dio _dio = Dio();
  final SecureTokenService _secureTokenService;

  DioService(this._secureTokenService) {
    _initializeDio();
  }

  void _initializeDio() {
    _setBaseOptions();
    _setInterceptors();
  }

  // 기본 Dio 설정
  void _setBaseOptions() {
    _dio.options.baseUrl = ApiEndpoints.baseUrl; // 서버 주소를 ApiEndpoints에서 가져옴
    _dio.options.connectTimeout = const Duration(milliseconds: 5000); // 연결 시간 초과 (5초)
    _dio.options.receiveTimeout = const Duration(milliseconds: 3000); // 응답 시간 초과 (3초)
  }

  // 요청 인터셉터 설정
  void _setInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          await _addAuthorizationHeader(options);
          return handler.next(options); // 다음 핸들러로 요청을 넘김
        },
        onError: (error, handler) {
          _handleError(error);
          return handler.next(error);
        },
      ),
    );
  }

  // Authorization 헤더에 토큰 추가
  Future<void> _addAuthorizationHeader(RequestOptions options) async {
    String? accessToken = await _secureTokenService.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
  }

  // 오류 처리 로직 (필요 시 확장 가능)
  void _handleError(DioException error) {
    // 추가적인 에러 처리 로직
    // TODO: 토큰 만료 시 리프레시 처리
  }

  Dio get dio => _dio;
}
