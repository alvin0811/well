// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tabs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Tabs {
  int get tabValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabsCopyWith<Tabs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabsCopyWith<$Res> {
  factory $TabsCopyWith(Tabs value, $Res Function(Tabs) then) =
      _$TabsCopyWithImpl<$Res, Tabs>;
  @useResult
  $Res call({int tabValue});
}

/// @nodoc
class _$TabsCopyWithImpl<$Res, $Val extends Tabs>
    implements $TabsCopyWith<$Res> {
  _$TabsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabValue = null,
  }) {
    return _then(_value.copyWith(
      tabValue: null == tabValue
          ? _value.tabValue
          : tabValue // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TabsImplCopyWith<$Res> implements $TabsCopyWith<$Res> {
  factory _$$TabsImplCopyWith(
          _$TabsImpl value, $Res Function(_$TabsImpl) then) =
      __$$TabsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tabValue});
}

/// @nodoc
class __$$TabsImplCopyWithImpl<$Res>
    extends _$TabsCopyWithImpl<$Res, _$TabsImpl>
    implements _$$TabsImplCopyWith<$Res> {
  __$$TabsImplCopyWithImpl(_$TabsImpl _value, $Res Function(_$TabsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabValue = null,
  }) {
    return _then(_$TabsImpl(
      tabValue: null == tabValue
          ? _value.tabValue
          : tabValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TabsImpl implements _Tabs {
  const _$TabsImpl({required this.tabValue});

  @override
  final int tabValue;

  @override
  String toString() {
    return 'Tabs(tabValue: $tabValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabsImpl &&
            (identical(other.tabValue, tabValue) ||
                other.tabValue == tabValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabsImplCopyWith<_$TabsImpl> get copyWith =>
      __$$TabsImplCopyWithImpl<_$TabsImpl>(this, _$identity);
}

abstract class _Tabs implements Tabs {
  const factory _Tabs({required final int tabValue}) = _$TabsImpl;

  @override
  int get tabValue;
  @override
  @JsonKey(ignore: true)
  _$$TabsImplCopyWith<_$TabsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
