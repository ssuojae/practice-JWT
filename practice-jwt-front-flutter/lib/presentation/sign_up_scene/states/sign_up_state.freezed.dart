// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) initial,
    required TResult Function(String email, String password) loading,
    required TResult Function(String email, String password) success,
    required TResult Function(String error, String email, String password)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? initial,
    TResult? Function(String email, String password)? loading,
    TResult? Function(String email, String password)? success,
    TResult? Function(String error, String email, String password)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? initial,
    TResult Function(String email, String password)? loading,
    TResult Function(String email, String password)? success,
    TResult Function(String error, String email, String password)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpInitial value) initial,
    required TResult Function(SignUpLoading value) loading,
    required TResult Function(SignUpSuccess value) success,
    required TResult Function(SignUpFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpInitial value)? initial,
    TResult? Function(SignUpLoading value)? loading,
    TResult? Function(SignUpSuccess value)? success,
    TResult? Function(SignUpFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpInitial value)? initial,
    TResult Function(SignUpLoading value)? loading,
    TResult Function(SignUpSuccess value)? success,
    TResult Function(SignUpFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpInitialImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpInitialImplCopyWith(
          _$SignUpInitialImpl value, $Res Function(_$SignUpInitialImpl) then) =
      __$$SignUpInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignUpInitialImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpInitialImpl>
    implements _$$SignUpInitialImplCopyWith<$Res> {
  __$$SignUpInitialImplCopyWithImpl(
      _$SignUpInitialImpl _value, $Res Function(_$SignUpInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignUpInitialImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpInitialImpl implements SignUpInitial {
  const _$SignUpInitialImpl({this.email = '', this.password = ''});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;

  @override
  String toString() {
    return 'SignUpState.initial(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpInitialImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpInitialImplCopyWith<_$SignUpInitialImpl> get copyWith =>
      __$$SignUpInitialImplCopyWithImpl<_$SignUpInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) initial,
    required TResult Function(String email, String password) loading,
    required TResult Function(String email, String password) success,
    required TResult Function(String error, String email, String password)
        failure,
  }) {
    return initial(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? initial,
    TResult? Function(String email, String password)? loading,
    TResult? Function(String email, String password)? success,
    TResult? Function(String error, String email, String password)? failure,
  }) {
    return initial?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? initial,
    TResult Function(String email, String password)? loading,
    TResult Function(String email, String password)? success,
    TResult Function(String error, String email, String password)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpInitial value) initial,
    required TResult Function(SignUpLoading value) loading,
    required TResult Function(SignUpSuccess value) success,
    required TResult Function(SignUpFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpInitial value)? initial,
    TResult? Function(SignUpLoading value)? loading,
    TResult? Function(SignUpSuccess value)? success,
    TResult? Function(SignUpFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpInitial value)? initial,
    TResult Function(SignUpLoading value)? loading,
    TResult Function(SignUpSuccess value)? success,
    TResult Function(SignUpFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SignUpInitial implements SignUpState {
  const factory SignUpInitial({final String email, final String password}) =
      _$SignUpInitialImpl;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpInitialImplCopyWith<_$SignUpInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpLoadingImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpLoadingImplCopyWith(
          _$SignUpLoadingImpl value, $Res Function(_$SignUpLoadingImpl) then) =
      __$$SignUpLoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignUpLoadingImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpLoadingImpl>
    implements _$$SignUpLoadingImplCopyWith<$Res> {
  __$$SignUpLoadingImplCopyWithImpl(
      _$SignUpLoadingImpl _value, $Res Function(_$SignUpLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignUpLoadingImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpLoadingImpl implements SignUpLoading {
  const _$SignUpLoadingImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpState.loading(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpLoadingImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpLoadingImplCopyWith<_$SignUpLoadingImpl> get copyWith =>
      __$$SignUpLoadingImplCopyWithImpl<_$SignUpLoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) initial,
    required TResult Function(String email, String password) loading,
    required TResult Function(String email, String password) success,
    required TResult Function(String error, String email, String password)
        failure,
  }) {
    return loading(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? initial,
    TResult? Function(String email, String password)? loading,
    TResult? Function(String email, String password)? success,
    TResult? Function(String error, String email, String password)? failure,
  }) {
    return loading?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? initial,
    TResult Function(String email, String password)? loading,
    TResult Function(String email, String password)? success,
    TResult Function(String error, String email, String password)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpInitial value) initial,
    required TResult Function(SignUpLoading value) loading,
    required TResult Function(SignUpSuccess value) success,
    required TResult Function(SignUpFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpInitial value)? initial,
    TResult? Function(SignUpLoading value)? loading,
    TResult? Function(SignUpSuccess value)? success,
    TResult? Function(SignUpFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpInitial value)? initial,
    TResult Function(SignUpLoading value)? loading,
    TResult Function(SignUpSuccess value)? success,
    TResult Function(SignUpFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SignUpLoading implements SignUpState {
  const factory SignUpLoading(
      {required final String email,
      required final String password}) = _$SignUpLoadingImpl;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpLoadingImplCopyWith<_$SignUpLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpSuccessImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpSuccessImplCopyWith(
          _$SignUpSuccessImpl value, $Res Function(_$SignUpSuccessImpl) then) =
      __$$SignUpSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignUpSuccessImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpSuccessImpl>
    implements _$$SignUpSuccessImplCopyWith<$Res> {
  __$$SignUpSuccessImplCopyWithImpl(
      _$SignUpSuccessImpl _value, $Res Function(_$SignUpSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignUpSuccessImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpSuccessImpl implements SignUpSuccess {
  const _$SignUpSuccessImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpState.success(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpSuccessImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpSuccessImplCopyWith<_$SignUpSuccessImpl> get copyWith =>
      __$$SignUpSuccessImplCopyWithImpl<_$SignUpSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) initial,
    required TResult Function(String email, String password) loading,
    required TResult Function(String email, String password) success,
    required TResult Function(String error, String email, String password)
        failure,
  }) {
    return success(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? initial,
    TResult? Function(String email, String password)? loading,
    TResult? Function(String email, String password)? success,
    TResult? Function(String error, String email, String password)? failure,
  }) {
    return success?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? initial,
    TResult Function(String email, String password)? loading,
    TResult Function(String email, String password)? success,
    TResult Function(String error, String email, String password)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpInitial value) initial,
    required TResult Function(SignUpLoading value) loading,
    required TResult Function(SignUpSuccess value) success,
    required TResult Function(SignUpFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpInitial value)? initial,
    TResult? Function(SignUpLoading value)? loading,
    TResult? Function(SignUpSuccess value)? success,
    TResult? Function(SignUpFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpInitial value)? initial,
    TResult Function(SignUpLoading value)? loading,
    TResult Function(SignUpSuccess value)? success,
    TResult Function(SignUpFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SignUpSuccess implements SignUpState {
  const factory SignUpSuccess(
      {required final String email,
      required final String password}) = _$SignUpSuccessImpl;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpSuccessImplCopyWith<_$SignUpSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpFailureImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpFailureImplCopyWith(
          _$SignUpFailureImpl value, $Res Function(_$SignUpFailureImpl) then) =
      __$$SignUpFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error, String email, String password});
}

/// @nodoc
class __$$SignUpFailureImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpFailureImpl>
    implements _$$SignUpFailureImplCopyWith<$Res> {
  __$$SignUpFailureImplCopyWithImpl(
      _$SignUpFailureImpl _value, $Res Function(_$SignUpFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignUpFailureImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpFailureImpl implements SignUpFailure {
  const _$SignUpFailureImpl(
      {required this.error, required this.email, required this.password});

  @override
  final String error;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpState.failure(error: $error, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpFailureImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, email, password);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpFailureImplCopyWith<_$SignUpFailureImpl> get copyWith =>
      __$$SignUpFailureImplCopyWithImpl<_$SignUpFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) initial,
    required TResult Function(String email, String password) loading,
    required TResult Function(String email, String password) success,
    required TResult Function(String error, String email, String password)
        failure,
  }) {
    return failure(error, email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? initial,
    TResult? Function(String email, String password)? loading,
    TResult? Function(String email, String password)? success,
    TResult? Function(String error, String email, String password)? failure,
  }) {
    return failure?.call(error, email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? initial,
    TResult Function(String email, String password)? loading,
    TResult Function(String email, String password)? success,
    TResult Function(String error, String email, String password)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error, email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpInitial value) initial,
    required TResult Function(SignUpLoading value) loading,
    required TResult Function(SignUpSuccess value) success,
    required TResult Function(SignUpFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpInitial value)? initial,
    TResult? Function(SignUpLoading value)? loading,
    TResult? Function(SignUpSuccess value)? success,
    TResult? Function(SignUpFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpInitial value)? initial,
    TResult Function(SignUpLoading value)? loading,
    TResult Function(SignUpSuccess value)? success,
    TResult Function(SignUpFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class SignUpFailure implements SignUpState {
  const factory SignUpFailure(
      {required final String error,
      required final String email,
      required final String password}) = _$SignUpFailureImpl;

  String get error;
  @override
  String get email;
  @override
  String get password;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpFailureImplCopyWith<_$SignUpFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
