// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_otp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChangePasswordOtpState {
  FormFieldState get code => throw _privateConstructorUsedError;
  bool get enableNext => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChangePasswordOtpStateCopyWith<ChangePasswordOtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordOtpStateCopyWith<$Res> {
  factory $ChangePasswordOtpStateCopyWith(ChangePasswordOtpState value,
          $Res Function(ChangePasswordOtpState) then) =
      _$ChangePasswordOtpStateCopyWithImpl<$Res, ChangePasswordOtpState>;
  @useResult
  $Res call({FormFieldState code, bool enableNext, String token});

  $FormFieldStateCopyWith<$Res> get code;
}

/// @nodoc
class _$ChangePasswordOtpStateCopyWithImpl<$Res,
        $Val extends ChangePasswordOtpState>
    implements $ChangePasswordOtpStateCopyWith<$Res> {
  _$ChangePasswordOtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? enableNext = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as FormFieldState,
      enableNext: null == enableNext
          ? _value.enableNext
          : enableNext // ignore: cast_nullable_to_non_nullable
              as bool,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FormFieldStateCopyWith<$Res> get code {
    return $FormFieldStateCopyWith<$Res>(_value.code, (value) {
      return _then(_value.copyWith(code: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChangePasswordOtpStateImplCopyWith<$Res>
    implements $ChangePasswordOtpStateCopyWith<$Res> {
  factory _$$ChangePasswordOtpStateImplCopyWith(
          _$ChangePasswordOtpStateImpl value,
          $Res Function(_$ChangePasswordOtpStateImpl) then) =
      __$$ChangePasswordOtpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormFieldState code, bool enableNext, String token});

  @override
  $FormFieldStateCopyWith<$Res> get code;
}

/// @nodoc
class __$$ChangePasswordOtpStateImplCopyWithImpl<$Res>
    extends _$ChangePasswordOtpStateCopyWithImpl<$Res,
        _$ChangePasswordOtpStateImpl>
    implements _$$ChangePasswordOtpStateImplCopyWith<$Res> {
  __$$ChangePasswordOtpStateImplCopyWithImpl(
      _$ChangePasswordOtpStateImpl _value,
      $Res Function(_$ChangePasswordOtpStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? enableNext = null,
    Object? token = null,
  }) {
    return _then(_$ChangePasswordOtpStateImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as FormFieldState,
      enableNext: null == enableNext
          ? _value.enableNext
          : enableNext // ignore: cast_nullable_to_non_nullable
              as bool,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangePasswordOtpStateImpl implements _ChangePasswordOtpState {
  const _$ChangePasswordOtpStateImpl(
      {this.code = const FormFieldState(),
      this.enableNext = false,
      this.token = emptyString});

  @override
  @JsonKey()
  final FormFieldState code;
  @override
  @JsonKey()
  final bool enableNext;
  @override
  @JsonKey()
  final String token;

  @override
  String toString() {
    return 'ChangePasswordOtpState(code: $code, enableNext: $enableNext, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordOtpStateImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.enableNext, enableNext) ||
                other.enableNext == enableNext) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, enableNext, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordOtpStateImplCopyWith<_$ChangePasswordOtpStateImpl>
      get copyWith => __$$ChangePasswordOtpStateImplCopyWithImpl<
          _$ChangePasswordOtpStateImpl>(this, _$identity);
}

abstract class _ChangePasswordOtpState implements ChangePasswordOtpState {
  const factory _ChangePasswordOtpState(
      {final FormFieldState code,
      final bool enableNext,
      final String token}) = _$ChangePasswordOtpStateImpl;

  @override
  FormFieldState get code;
  @override
  bool get enableNext;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$ChangePasswordOtpStateImplCopyWith<_$ChangePasswordOtpStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
