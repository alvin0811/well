// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'healthy_living_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HealthyLivingDetailState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HealthyLivingDetailStateCopyWith<HealthyLivingDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthyLivingDetailStateCopyWith<$Res> {
  factory $HealthyLivingDetailStateCopyWith(HealthyLivingDetailState value,
          $Res Function(HealthyLivingDetailState) then) =
      _$HealthyLivingDetailStateCopyWithImpl<$Res, HealthyLivingDetailState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$HealthyLivingDetailStateCopyWithImpl<$Res,
        $Val extends HealthyLivingDetailState>
    implements $HealthyLivingDetailStateCopyWith<$Res> {
  _$HealthyLivingDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthyLivingDetailStateImplCopyWith<$Res>
    implements $HealthyLivingDetailStateCopyWith<$Res> {
  factory _$$HealthyLivingDetailStateImplCopyWith(
          _$HealthyLivingDetailStateImpl value,
          $Res Function(_$HealthyLivingDetailStateImpl) then) =
      __$$HealthyLivingDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$HealthyLivingDetailStateImplCopyWithImpl<$Res>
    extends _$HealthyLivingDetailStateCopyWithImpl<$Res,
        _$HealthyLivingDetailStateImpl>
    implements _$$HealthyLivingDetailStateImplCopyWith<$Res> {
  __$$HealthyLivingDetailStateImplCopyWithImpl(
      _$HealthyLivingDetailStateImpl _value,
      $Res Function(_$HealthyLivingDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$HealthyLivingDetailStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HealthyLivingDetailStateImpl extends _HealthyLivingDetailState {
  _$HealthyLivingDetailStateImpl({this.isLoading = false}) : super._();

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'HealthyLivingDetailState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthyLivingDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthyLivingDetailStateImplCopyWith<_$HealthyLivingDetailStateImpl>
      get copyWith => __$$HealthyLivingDetailStateImplCopyWithImpl<
          _$HealthyLivingDetailStateImpl>(this, _$identity);
}

abstract class _HealthyLivingDetailState extends HealthyLivingDetailState {
  factory _HealthyLivingDetailState({final bool isLoading}) =
      _$HealthyLivingDetailStateImpl;
  _HealthyLivingDetailState._() : super._();

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$HealthyLivingDetailStateImplCopyWith<_$HealthyLivingDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
