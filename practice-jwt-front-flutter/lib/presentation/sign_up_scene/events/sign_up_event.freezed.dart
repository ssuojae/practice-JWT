// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signUpPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? signUpPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signUpPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpStarted value) started,
    required TResult Function(SignUpEmailChanged value) emailChanged,
    required TResult Function(SignUpPasswordChanged value) passwordChanged,
    required TResult Function(SignUpPressed value) signUpPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpStarted value)? started,
    TResult? Function(SignUpEmailChanged value)? emailChanged,
    TResult? Function(SignUpPasswordChanged value)? passwordChanged,
    TResult? Function(SignUpPressed value)? signUpPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpStarted value)? started,
    TResult Function(SignUpEmailChanged value)? emailChanged,
    TResult Function(SignUpPasswordChanged value)? passwordChanged,
    TResult Function(SignUpPressed value)? signUpPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res, SignUpEvent>;
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res, $Val extends SignUpEvent>
    implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SignUpStartedImplCopyWith<$Res> {
  factory _$$SignUpStartedImplCopyWith(
          _$SignUpStartedImpl value, $Res Function(_$SignUpStartedImpl) then) =
      __$$SignUpStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpStartedImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignUpStartedImpl>
    implements _$$SignUpStartedImplCopyWith<$Res> {
  __$$SignUpStartedImplCopyWithImpl(
      _$SignUpStartedImpl _value, $Res Function(_$SignUpStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignUpStartedImpl implements SignUpStarted {
  const _$SignUpStartedImpl();

  @override
  String toString() {
    return 'SignUpEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signUpPressed,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? signUpPressed,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signUpPressed,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpStarted value) started,
    required TResult Function(SignUpEmailChanged value) emailChanged,
    required TResult Function(SignUpPasswordChanged value) passwordChanged,
    required TResult Function(SignUpPressed value) signUpPressed,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpStarted value)? started,
    TResult? Function(SignUpEmailChanged value)? emailChanged,
    TResult? Function(SignUpPasswordChanged value)? passwordChanged,
    TResult? Function(SignUpPressed value)? signUpPressed,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpStarted value)? started,
    TResult Function(SignUpEmailChanged value)? emailChanged,
    TResult Function(SignUpPasswordChanged value)? passwordChanged,
    TResult Function(SignUpPressed value)? signUpPressed,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class SignUpStarted implements SignUpEvent {
  const factory SignUpStarted() = _$SignUpStartedImpl;
}

/// @nodoc
abstract class _$$SignUpEmailChangedImplCopyWith<$Res> {
  factory _$$SignUpEmailChangedImplCopyWith(_$SignUpEmailChangedImpl value,
          $Res Function(_$SignUpEmailChangedImpl) then) =
      __$$SignUpEmailChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SignUpEmailChangedImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignUpEmailChangedImpl>
    implements _$$SignUpEmailChangedImplCopyWith<$Res> {
  __$$SignUpEmailChangedImplCopyWithImpl(_$SignUpEmailChangedImpl _value,
      $Res Function(_$SignUpEmailChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SignUpEmailChangedImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpEmailChangedImpl implements SignUpEmailChanged {
  const _$SignUpEmailChangedImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SignUpEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpEmailChangedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpEmailChangedImplCopyWith<_$SignUpEmailChangedImpl> get copyWith =>
      __$$SignUpEmailChangedImplCopyWithImpl<_$SignUpEmailChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signUpPressed,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? signUpPressed,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signUpPressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpStarted value) started,
    required TResult Function(SignUpEmailChanged value) emailChanged,
    required TResult Function(SignUpPasswordChanged value) passwordChanged,
    required TResult Function(SignUpPressed value) signUpPressed,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpStarted value)? started,
    TResult? Function(SignUpEmailChanged value)? emailChanged,
    TResult? Function(SignUpPasswordChanged value)? passwordChanged,
    TResult? Function(SignUpPressed value)? signUpPressed,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpStarted value)? started,
    TResult Function(SignUpEmailChanged value)? emailChanged,
    TResult Function(SignUpPasswordChanged value)? passwordChanged,
    TResult Function(SignUpPressed value)? signUpPressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class SignUpEmailChanged implements SignUpEvent {
  const factory SignUpEmailChanged(final String email) =
      _$SignUpEmailChangedImpl;

  String get email;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpEmailChangedImplCopyWith<_$SignUpEmailChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpPasswordChangedImplCopyWith<$Res> {
  factory _$$SignUpPasswordChangedImplCopyWith(
          _$SignUpPasswordChangedImpl value,
          $Res Function(_$SignUpPasswordChangedImpl) then) =
      __$$SignUpPasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$SignUpPasswordChangedImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignUpPasswordChangedImpl>
    implements _$$SignUpPasswordChangedImplCopyWith<$Res> {
  __$$SignUpPasswordChangedImplCopyWithImpl(_$SignUpPasswordChangedImpl _value,
      $Res Function(_$SignUpPasswordChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$SignUpPasswordChangedImpl(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpPasswordChangedImpl implements SignUpPasswordChanged {
  const _$SignUpPasswordChangedImpl(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'SignUpEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpPasswordChangedImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpPasswordChangedImplCopyWith<_$SignUpPasswordChangedImpl>
      get copyWith => __$$SignUpPasswordChangedImplCopyWithImpl<
          _$SignUpPasswordChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signUpPressed,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? signUpPressed,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signUpPressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpStarted value) started,
    required TResult Function(SignUpEmailChanged value) emailChanged,
    required TResult Function(SignUpPasswordChanged value) passwordChanged,
    required TResult Function(SignUpPressed value) signUpPressed,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpStarted value)? started,
    TResult? Function(SignUpEmailChanged value)? emailChanged,
    TResult? Function(SignUpPasswordChanged value)? passwordChanged,
    TResult? Function(SignUpPressed value)? signUpPressed,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpStarted value)? started,
    TResult Function(SignUpEmailChanged value)? emailChanged,
    TResult Function(SignUpPasswordChanged value)? passwordChanged,
    TResult Function(SignUpPressed value)? signUpPressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class SignUpPasswordChanged implements SignUpEvent {
  const factory SignUpPasswordChanged(final String password) =
      _$SignUpPasswordChangedImpl;

  String get password;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpPasswordChangedImplCopyWith<_$SignUpPasswordChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpPressedImplCopyWith<$Res> {
  factory _$$SignUpPressedImplCopyWith(
          _$SignUpPressedImpl value, $Res Function(_$SignUpPressedImpl) then) =
      __$$SignUpPressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpPressedImplCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$SignUpPressedImpl>
    implements _$$SignUpPressedImplCopyWith<$Res> {
  __$$SignUpPressedImplCopyWithImpl(
      _$SignUpPressedImpl _value, $Res Function(_$SignUpPressedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignUpPressedImpl implements SignUpPressed {
  const _$SignUpPressedImpl();

  @override
  String toString() {
    return 'SignUpEvent.signUpPressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpPressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() signUpPressed,
  }) {
    return signUpPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? signUpPressed,
  }) {
    return signUpPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? signUpPressed,
    required TResult orElse(),
  }) {
    if (signUpPressed != null) {
      return signUpPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpStarted value) started,
    required TResult Function(SignUpEmailChanged value) emailChanged,
    required TResult Function(SignUpPasswordChanged value) passwordChanged,
    required TResult Function(SignUpPressed value) signUpPressed,
  }) {
    return signUpPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpStarted value)? started,
    TResult? Function(SignUpEmailChanged value)? emailChanged,
    TResult? Function(SignUpPasswordChanged value)? passwordChanged,
    TResult? Function(SignUpPressed value)? signUpPressed,
  }) {
    return signUpPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpStarted value)? started,
    TResult Function(SignUpEmailChanged value)? emailChanged,
    TResult Function(SignUpPasswordChanged value)? passwordChanged,
    TResult Function(SignUpPressed value)? signUpPressed,
    required TResult orElse(),
  }) {
    if (signUpPressed != null) {
      return signUpPressed(this);
    }
    return orElse();
  }
}

abstract class SignUpPressed implements SignUpEvent {
  const factory SignUpPressed() = _$SignUpPressedImpl;
}
