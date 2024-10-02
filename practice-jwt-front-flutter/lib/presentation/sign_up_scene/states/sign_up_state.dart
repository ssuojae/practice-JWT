import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial({
    @Default('') String email,
    @Default('') String password,
  }) = SignUpInitial;

  const factory SignUpState.loading({
    required String email,
    required String password,
  }) = SignUpLoading;

  const factory SignUpState.success({
    required String email,
    required String password,
  }) = SignUpSuccess;

  const factory SignUpState.failure({
    required String error,
    required String email,
    required String password,
  }) = SignUpFailure;
}
