// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_reset_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingResetPasswordState {
  FormFieldState get password => throw _privateConstructorUsedError;
  FormFieldState get confirmPassword => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  bool get enableNext => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingResetPasswordStateCopyWith<SettingResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingResetPasswordStateCopyWith<$Res> {
  factory $SettingResetPasswordStateCopyWith(SettingResetPasswordState value,
          $Res Function(SettingResetPasswordState) then) =
      _$SettingResetPasswordStateCopyWithImpl<$Res, SettingResetPasswordState>;
  @useResult
  $Res call(
      {FormFieldState password,
      FormFieldState confirmPassword,
      String token,
      bool enableNext});

  $FormFieldStateCopyWith<$Res> get password;
  $FormFieldStateCopyWith<$Res> get confirmPassword;
}

/// @nodoc
class _$SettingResetPasswordStateCopyWithImpl<$Res,
        $Val extends SettingResetPasswordState>
    implements $SettingResetPasswordStateCopyWith<$Res> {
  _$SettingResetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
    Object? token = null,
    Object? enableNext = null,
  }) {
    return _then(_value.copyWith(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormFieldState,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as FormFieldState,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      enableNext: null == enableNext
          ? _value.enableNext
          : enableNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FormFieldStateCopyWith<$Res> get password {
    return $FormFieldStateCopyWith<$Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FormFieldStateCopyWith<$Res> get confirmPassword {
    return $FormFieldStateCopyWith<$Res>(_value.confirmPassword, (value) {
      return _then(_value.copyWith(confirmPassword: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingResetPasswordStateImplCopyWith<$Res>
    implements $SettingResetPasswordStateCopyWith<$Res> {
  factory _$$SettingResetPasswordStateImplCopyWith(
          _$SettingResetPasswordStateImpl value,
          $Res Function(_$SettingResetPasswordStateImpl) then) =
      __$$SettingResetPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormFieldState password,
      FormFieldState confirmPassword,
      String token,
      bool enableNext});

  @override
  $FormFieldStateCopyWith<$Res> get password;
  @override
  $FormFieldStateCopyWith<$Res> get confirmPassword;
}

/// @nodoc
class __$$SettingResetPasswordStateImplCopyWithImpl<$Res>
    extends _$SettingResetPasswordStateCopyWithImpl<$Res,
        _$SettingResetPasswordStateImpl>
    implements _$$SettingResetPasswordStateImplCopyWith<$Res> {
  __$$SettingResetPasswordStateImplCopyWithImpl(
      _$SettingResetPasswordStateImpl _value,
      $Res Function(_$SettingResetPasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
    Object? token = null,
    Object? enableNext = null,
  }) {
    return _then(_$SettingResetPasswordStateImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormFieldState,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as FormFieldState,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      enableNext: null == enableNext
          ? _value.enableNext
          : enableNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SettingResetPasswordStateImpl extends _SettingResetPasswordState {
  const _$SettingResetPasswordStateImpl(
      {this.password = const FormFieldState(),
      this.confirmPassword = const FormFieldState(),
      this.token = emptyString,
      this.enableNext = false})
      : super._();

  @override
  @JsonKey()
  final FormFieldState password;
  @override
  @JsonKey()
  final FormFieldState confirmPassword;
  @override
  @JsonKey()
  final String token;
  @override
  @JsonKey()
  final bool enableNext;

  @override
  String toString() {
    return 'SettingResetPasswordState(password: $password, confirmPassword: $confirmPassword, token: $token, enableNext: $enableNext)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingResetPasswordStateImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.enableNext, enableNext) ||
                other.enableNext == enableNext));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, password, confirmPassword, token, enableNext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingResetPasswordStateImplCopyWith<_$SettingResetPasswordStateImpl>
      get copyWith => __$$SettingResetPasswordStateImplCopyWithImpl<
          _$SettingResetPasswordStateImpl>(this, _$identity);
}

abstract class _SettingResetPasswordState extends SettingResetPasswordState {
  const factory _SettingResetPasswordState(
      {final FormFieldState password,
      final FormFieldState confirmPassword,
      final String token,
      final bool enableNext}) = _$SettingResetPasswordStateImpl;
  const _SettingResetPasswordState._() : super._();

  @override
  FormFieldState get password;
  @override
  FormFieldState get confirmPassword;
  @override
  String get token;
  @override
  bool get enableNext;
  @override
  @JsonKey(ignore: true)
  _$$SettingResetPasswordStateImplCopyWith<_$SettingResetPasswordStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
