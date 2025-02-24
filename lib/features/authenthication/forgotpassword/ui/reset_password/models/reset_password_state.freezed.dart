// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResetPasswordState {
  FormFieldState get password => throw _privateConstructorUsedError;
  FormFieldState get confirmPassword => throw _privateConstructorUsedError;
  bool get enableNext => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res, ResetPasswordState>;
  @useResult
  $Res call(
      {FormFieldState password,
      FormFieldState confirmPassword,
      bool enableNext});

  $FormFieldStateCopyWith<$Res> get password;
  $FormFieldStateCopyWith<$Res> get confirmPassword;
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res, $Val extends ResetPasswordState>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
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
abstract class _$$ResetPasswordStateImplCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordStateImplCopyWith(_$ResetPasswordStateImpl value,
          $Res Function(_$ResetPasswordStateImpl) then) =
      __$$ResetPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormFieldState password,
      FormFieldState confirmPassword,
      bool enableNext});

  @override
  $FormFieldStateCopyWith<$Res> get password;
  @override
  $FormFieldStateCopyWith<$Res> get confirmPassword;
}

/// @nodoc
class __$$ResetPasswordStateImplCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$ResetPasswordStateImpl>
    implements _$$ResetPasswordStateImplCopyWith<$Res> {
  __$$ResetPasswordStateImplCopyWithImpl(_$ResetPasswordStateImpl _value,
      $Res Function(_$ResetPasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
    Object? enableNext = null,
  }) {
    return _then(_$ResetPasswordStateImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as FormFieldState,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as FormFieldState,
      enableNext: null == enableNext
          ? _value.enableNext
          : enableNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ResetPasswordStateImpl extends _ResetPasswordState {
  const _$ResetPasswordStateImpl(
      {this.password = const FormFieldState(),
      this.confirmPassword = const FormFieldState(),
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
  final bool enableNext;

  @override
  String toString() {
    return 'ResetPasswordState(password: $password, confirmPassword: $confirmPassword, enableNext: $enableNext)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordStateImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.enableNext, enableNext) ||
                other.enableNext == enableNext));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, password, confirmPassword, enableNext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordStateImplCopyWith<_$ResetPasswordStateImpl> get copyWith =>
      __$$ResetPasswordStateImplCopyWithImpl<_$ResetPasswordStateImpl>(
          this, _$identity);
}

abstract class _ResetPasswordState extends ResetPasswordState {
  const factory _ResetPasswordState(
      {final FormFieldState password,
      final FormFieldState confirmPassword,
      final bool enableNext}) = _$ResetPasswordStateImpl;
  const _ResetPasswordState._() : super._();

  @override
  FormFieldState get password;
  @override
  FormFieldState get confirmPassword;
  @override
  bool get enableNext;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordStateImplCopyWith<_$ResetPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
