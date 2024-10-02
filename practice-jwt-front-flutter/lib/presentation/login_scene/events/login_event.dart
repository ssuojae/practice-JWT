import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = LoginStarted; // 로그인 페이지 시작
  const factory LoginEvent.emailChanged(String email) = EmailChanged; // 이메일 변경
  const factory LoginEvent.passwordChanged(String password) = PasswordChanged;
  const factory LoginEvent.loginPressed() = LoginPressed; // 로그인 버튼 눌림
}