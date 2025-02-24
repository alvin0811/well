// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_field_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormFieldState {
  String get content => throw _privateConstructorUsedError;
  bool get showErrorIcon => throw _privateConstructorUsedError;
  CubitMessages? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormFieldStateCopyWith<FormFieldState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormFieldStateCopyWith<$Res> {
  factory $FormFieldStateCopyWith(
          FormFieldState value, $Res Function(FormFieldState) then) =
      _$FormFieldStateCopyWithImpl<$Res, FormFieldState>;
  @useResult
  $Res call({String content, bool showErrorIcon, CubitMessages? error});
}

/// @nodoc
class _$FormFieldStateCopyWithImpl<$Res, $Val extends FormFieldState>
    implements $FormFieldStateCopyWith<$Res> {
  _$FormFieldStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? showErrorIcon = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorIcon: null == showErrorIcon
          ? _value.showErrorIcon
          : showErrorIcon // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as CubitMessages?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormFieldStateImplCopyWith<$Res>
    implements $FormFieldStateCopyWith<$Res> {
  factory _$$FormFieldStateImplCopyWith(_$FormFieldStateImpl value,
          $Res Function(_$FormFieldStateImpl) then) =
      __$$FormFieldStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, bool showErrorIcon, CubitMessages? error});
}

/// @nodoc
class __$$FormFieldStateImplCopyWithImpl<$Res>
    extends _$FormFieldStateCopyWithImpl<$Res, _$FormFieldStateImpl>
    implements _$$FormFieldStateImplCopyWith<$Res> {
  __$$FormFieldStateImplCopyWithImpl(
      _$FormFieldStateImpl _value, $Res Function(_$FormFieldStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? showErrorIcon = null,
    Object? error = freezed,
  }) {
    return _then(_$FormFieldStateImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorIcon: null == showErrorIcon
          ? _value.showErrorIcon
          : showErrorIcon // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as CubitMessages?,
    ));
  }
}

/// @nodoc

class _$FormFieldStateImpl implements _FormFieldState {
  const _$FormFieldStateImpl(
      {this.content = emptyString, this.showErrorIcon = false, this.error});

  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final bool showErrorIcon;
  @override
  final CubitMessages? error;

  @override
  String toString() {
    return 'FormFieldState(content: $content, showErrorIcon: $showErrorIcon, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormFieldStateImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.showErrorIcon, showErrorIcon) ||
                other.showErrorIcon == showErrorIcon) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, showErrorIcon, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormFieldStateImplCopyWith<_$FormFieldStateImpl> get copyWith =>
      __$$FormFieldStateImplCopyWithImpl<_$FormFieldStateImpl>(
          this, _$identity);
}

abstract class _FormFieldState implements FormFieldState {
  const factory _FormFieldState(
      {final String content,
      final bool showErrorIcon,
      final CubitMessages? error}) = _$FormFieldStateImpl;

  @override
  String get content;
  @override
  bool get showErrorIcon;
  @override
  CubitMessages? get error;
  @override
  @JsonKey(ignore: true)
  _$$FormFieldStateImplCopyWith<_$FormFieldStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
