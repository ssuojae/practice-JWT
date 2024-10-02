import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default('') String email,  // 이메일 기본값
    @Default('') String password,  // 비밀번호 기본값
  }) = LoginInitial;

  const factory LoginState.loading({
    required String email,
    required String password,
  }) = LoginLoading;

  const factory LoginState.success({
    required String email,
    required String password,
  }) = LoginSuccess;

  const factory LoginState.failure({
    required String error,
    required String email,
    required String password,
  }) = LoginFailure;
}
