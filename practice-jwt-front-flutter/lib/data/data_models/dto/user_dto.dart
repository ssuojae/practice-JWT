import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto ({
    required String email,
    required String password,
  }) = _UserDto;
}