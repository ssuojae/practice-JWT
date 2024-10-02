import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_event.freezed.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.started() = SignUpStarted;
  const factory SignUpEvent.emailChanged(String email) = SignUpEmailChanged;
  const factory SignUpEvent.passwordChanged(String password) = SignUpPasswordChanged;
  const factory SignUpEvent.signUpPressed() = SignUpPressed;
}
