// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SleepState {
  int? get sleepHours => throw _privateConstructorUsedError;
  bool? get fellWellRested => throw _privateConstructorUsedError;
  bool? get sleepSameTime => throw _privateConstructorUsedError;
  int? get sleepInterruptions => throw _privateConstructorUsedError;
  bool? get dayNap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SleepStateCopyWith<SleepState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepStateCopyWith<$Res> {
  factory $SleepStateCopyWith(
          SleepState value, $Res Function(SleepState) then) =
      _$SleepStateCopyWithImpl<$Res, SleepState>;
  @useResult
  $Res call(
      {int? sleepHours,
      bool? fellWellRested,
      bool? sleepSameTime,
      int? sleepInterruptions,
      bool? dayNap});
}

/// @nodoc
class _$SleepStateCopyWithImpl<$Res, $Val extends SleepState>
    implements $SleepStateCopyWith<$Res> {
  _$SleepStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sleepHours = freezed,
    Object? fellWellRested = freezed,
    Object? sleepSameTime = freezed,
    Object? sleepInterruptions = freezed,
    Object? dayNap = freezed,
  }) {
    return _then(_value.copyWith(
      sleepHours: freezed == sleepHours
          ? _value.sleepHours
          : sleepHours // ignore: cast_nullable_to_non_nullable
              as int?,
      fellWellRested: freezed == fellWellRested
          ? _value.fellWellRested
          : fellWellRested // ignore: cast_nullable_to_non_nullable
              as bool?,
      sleepSameTime: freezed == sleepSameTime
          ? _value.sleepSameTime
          : sleepSameTime // ignore: cast_nullable_to_non_nullable
              as bool?,
      sleepInterruptions: freezed == sleepInterruptions
          ? _value.sleepInterruptions
          : sleepInterruptions // ignore: cast_nullable_to_non_nullable
              as int?,
      dayNap: freezed == dayNap
          ? _value.dayNap
          : dayNap // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SleepStateImplCopyWith<$Res>
    implements $SleepStateCopyWith<$Res> {
  factory _$$SleepStateImplCopyWith(
          _$SleepStateImpl value, $Res Function(_$SleepStateImpl) then) =
      __$$SleepStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? sleepHours,
      bool? fellWellRested,
      bool? sleepSameTime,
      int? sleepInterruptions,
      bool? dayNap});
}

/// @nodoc
class __$$SleepStateImplCopyWithImpl<$Res>
    extends _$SleepStateCopyWithImpl<$Res, _$SleepStateImpl>
    implements _$$SleepStateImplCopyWith<$Res> {
  __$$SleepStateImplCopyWithImpl(
      _$SleepStateImpl _value, $Res Function(_$SleepStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sleepHours = freezed,
    Object? fellWellRested = freezed,
    Object? sleepSameTime = freezed,
    Object? sleepInterruptions = freezed,
    Object? dayNap = freezed,
  }) {
    return _then(_$SleepStateImpl(
      sleepHours: freezed == sleepHours
          ? _value.sleepHours
          : sleepHours // ignore: cast_nullable_to_non_nullable
              as int?,
      fellWellRested: freezed == fellWellRested
          ? _value.fellWellRested
          : fellWellRested // ignore: cast_nullable_to_non_nullable
              as bool?,
      sleepSameTime: freezed == sleepSameTime
          ? _value.sleepSameTime
          : sleepSameTime // ignore: cast_nullable_to_non_nullable
              as bool?,
      sleepInterruptions: freezed == sleepInterruptions
          ? _value.sleepInterruptions
          : sleepInterruptions // ignore: cast_nullable_to_non_nullable
              as int?,
      dayNap: freezed == dayNap
          ? _value.dayNap
          : dayNap // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$SleepStateImpl extends _SleepState {
  const _$SleepStateImpl(
      {this.sleepHours = 0,
      this.fellWellRested = null,
      this.sleepSameTime = null,
      this.sleepInterruptions = 0,
      this.dayNap = null})
      : super._();

  @override
  @JsonKey()
  final int? sleepHours;
  @override
  @JsonKey()
  final bool? fellWellRested;
  @override
  @JsonKey()
  final bool? sleepSameTime;
  @override
  @JsonKey()
  final int? sleepInterruptions;
  @override
  @JsonKey()
  final bool? dayNap;

  @override
  String toString() {
    return 'SleepState(sleepHours: $sleepHours, fellWellRested: $fellWellRested, sleepSameTime: $sleepSameTime, sleepInterruptions: $sleepInterruptions, dayNap: $dayNap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepStateImpl &&
            (identical(other.sleepHours, sleepHours) ||
                other.sleepHours == sleepHours) &&
            (identical(other.fellWellRested, fellWellRested) ||
                other.fellWellRested == fellWellRested) &&
            (identical(other.sleepSameTime, sleepSameTime) ||
                other.sleepSameTime == sleepSameTime) &&
            (identical(other.sleepInterruptions, sleepInterruptions) ||
                other.sleepInterruptions == sleepInterruptions) &&
            (identical(other.dayNap, dayNap) || other.dayNap == dayNap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sleepHours, fellWellRested,
      sleepSameTime, sleepInterruptions, dayNap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepStateImplCopyWith<_$SleepStateImpl> get copyWith =>
      __$$SleepStateImplCopyWithImpl<_$SleepStateImpl>(this, _$identity);
}

abstract class _SleepState extends SleepState {
  const factory _SleepState(
      {final int? sleepHours,
      final bool? fellWellRested,
      final bool? sleepSameTime,
      final int? sleepInterruptions,
      final bool? dayNap}) = _$SleepStateImpl;
  const _SleepState._() : super._();

  @override
  int? get sleepHours;
  @override
  bool? get fellWellRested;
  @override
  bool? get sleepSameTime;
  @override
  int? get sleepInterruptions;
  @override
  bool? get dayNap;
  @override
  @JsonKey(ignore: true)
  _$$SleepStateImplCopyWith<_$SleepStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
