// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'physical_activity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhysicalActivityState {
  int get activeTime => throw _privateConstructorUsedError;
  bool? get haveDisability => throw _privateConstructorUsedError;
  List<int> get disabilityIds => throw _privateConstructorUsedError;
  PhysicalActivityResponse get physicalActivityResponse =>
      throw _privateConstructorUsedError;
  List<DisabilityItem> get disabilityItems =>
      throw _privateConstructorUsedError;
  bool get enableNext => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhysicalActivityStateCopyWith<PhysicalActivityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhysicalActivityStateCopyWith<$Res> {
  factory $PhysicalActivityStateCopyWith(PhysicalActivityState value,
          $Res Function(PhysicalActivityState) then) =
      _$PhysicalActivityStateCopyWithImpl<$Res, PhysicalActivityState>;
  @useResult
  $Res call(
      {int activeTime,
      bool? haveDisability,
      List<int> disabilityIds,
      PhysicalActivityResponse physicalActivityResponse,
      List<DisabilityItem> disabilityItems,
      bool enableNext});
}

/// @nodoc
class _$PhysicalActivityStateCopyWithImpl<$Res,
        $Val extends PhysicalActivityState>
    implements $PhysicalActivityStateCopyWith<$Res> {
  _$PhysicalActivityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTime = null,
    Object? haveDisability = freezed,
    Object? disabilityIds = null,
    Object? physicalActivityResponse = null,
    Object? disabilityItems = null,
    Object? enableNext = null,
  }) {
    return _then(_value.copyWith(
      activeTime: null == activeTime
          ? _value.activeTime
          : activeTime // ignore: cast_nullable_to_non_nullable
              as int,
      haveDisability: freezed == haveDisability
          ? _value.haveDisability
          : haveDisability // ignore: cast_nullable_to_non_nullable
              as bool?,
      disabilityIds: null == disabilityIds
          ? _value.disabilityIds
          : disabilityIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      physicalActivityResponse: null == physicalActivityResponse
          ? _value.physicalActivityResponse
          : physicalActivityResponse // ignore: cast_nullable_to_non_nullable
              as PhysicalActivityResponse,
      disabilityItems: null == disabilityItems
          ? _value.disabilityItems
          : disabilityItems // ignore: cast_nullable_to_non_nullable
              as List<DisabilityItem>,
      enableNext: null == enableNext
          ? _value.enableNext
          : enableNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhysicalActivityStateImplCopyWith<$Res>
    implements $PhysicalActivityStateCopyWith<$Res> {
  factory _$$PhysicalActivityStateImplCopyWith(
          _$PhysicalActivityStateImpl value,
          $Res Function(_$PhysicalActivityStateImpl) then) =
      __$$PhysicalActivityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int activeTime,
      bool? haveDisability,
      List<int> disabilityIds,
      PhysicalActivityResponse physicalActivityResponse,
      List<DisabilityItem> disabilityItems,
      bool enableNext});
}

/// @nodoc
class __$$PhysicalActivityStateImplCopyWithImpl<$Res>
    extends _$PhysicalActivityStateCopyWithImpl<$Res,
        _$PhysicalActivityStateImpl>
    implements _$$PhysicalActivityStateImplCopyWith<$Res> {
  __$$PhysicalActivityStateImplCopyWithImpl(_$PhysicalActivityStateImpl _value,
      $Res Function(_$PhysicalActivityStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTime = null,
    Object? haveDisability = freezed,
    Object? disabilityIds = null,
    Object? physicalActivityResponse = null,
    Object? disabilityItems = null,
    Object? enableNext = null,
  }) {
    return _then(_$PhysicalActivityStateImpl(
      activeTime: null == activeTime
          ? _value.activeTime
          : activeTime // ignore: cast_nullable_to_non_nullable
              as int,
      haveDisability: freezed == haveDisability
          ? _value.haveDisability
          : haveDisability // ignore: cast_nullable_to_non_nullable
              as bool?,
      disabilityIds: null == disabilityIds
          ? _value._disabilityIds
          : disabilityIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      physicalActivityResponse: null == physicalActivityResponse
          ? _value.physicalActivityResponse
          : physicalActivityResponse // ignore: cast_nullable_to_non_nullable
              as PhysicalActivityResponse,
      disabilityItems: null == disabilityItems
          ? _value._disabilityItems
          : disabilityItems // ignore: cast_nullable_to_non_nullable
              as List<DisabilityItem>,
      enableNext: null == enableNext
          ? _value.enableNext
          : enableNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PhysicalActivityStateImpl extends _PhysicalActivityState {
  const _$PhysicalActivityStateImpl(
      {this.activeTime = 0,
      this.haveDisability = null,
      final List<int> disabilityIds = const [],
      this.physicalActivityResponse = const PhysicalActivityResponse(
          activeTime: -1, haveDisability: false, disabilityIds: []),
      final List<DisabilityItem> disabilityItems = const [],
      this.enableNext = false})
      : _disabilityIds = disabilityIds,
        _disabilityItems = disabilityItems,
        super._();

  @override
  @JsonKey()
  final int activeTime;
  @override
  @JsonKey()
  final bool? haveDisability;
  final List<int> _disabilityIds;
  @override
  @JsonKey()
  List<int> get disabilityIds {
    if (_disabilityIds is EqualUnmodifiableListView) return _disabilityIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disabilityIds);
  }

  @override
  @JsonKey()
  final PhysicalActivityResponse physicalActivityResponse;
  final List<DisabilityItem> _disabilityItems;
  @override
  @JsonKey()
  List<DisabilityItem> get disabilityItems {
    if (_disabilityItems is EqualUnmodifiableListView) return _disabilityItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disabilityItems);
  }

  @override
  @JsonKey()
  final bool enableNext;

  @override
  String toString() {
    return 'PhysicalActivityState(activeTime: $activeTime, haveDisability: $haveDisability, disabilityIds: $disabilityIds, physicalActivityResponse: $physicalActivityResponse, disabilityItems: $disabilityItems, enableNext: $enableNext)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhysicalActivityStateImpl &&
            (identical(other.activeTime, activeTime) ||
                other.activeTime == activeTime) &&
            (identical(other.haveDisability, haveDisability) ||
                other.haveDisability == haveDisability) &&
            const DeepCollectionEquality()
                .equals(other._disabilityIds, _disabilityIds) &&
            (identical(
                    other.physicalActivityResponse, physicalActivityResponse) ||
                other.physicalActivityResponse == physicalActivityResponse) &&
            const DeepCollectionEquality()
                .equals(other._disabilityItems, _disabilityItems) &&
            (identical(other.enableNext, enableNext) ||
                other.enableNext == enableNext));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeTime,
      haveDisability,
      const DeepCollectionEquality().hash(_disabilityIds),
      physicalActivityResponse,
      const DeepCollectionEquality().hash(_disabilityItems),
      enableNext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhysicalActivityStateImplCopyWith<_$PhysicalActivityStateImpl>
      get copyWith => __$$PhysicalActivityStateImplCopyWithImpl<
          _$PhysicalActivityStateImpl>(this, _$identity);
}

abstract class _PhysicalActivityState extends PhysicalActivityState {
  const factory _PhysicalActivityState(
      {final int activeTime,
      final bool? haveDisability,
      final List<int> disabilityIds,
      final PhysicalActivityResponse physicalActivityResponse,
      final List<DisabilityItem> disabilityItems,
      final bool enableNext}) = _$PhysicalActivityStateImpl;
  const _PhysicalActivityState._() : super._();

  @override
  int get activeTime;
  @override
  bool? get haveDisability;
  @override
  List<int> get disabilityIds;
  @override
  PhysicalActivityResponse get physicalActivityResponse;
  @override
  List<DisabilityItem> get disabilityItems;
  @override
  bool get enableNext;
  @override
  @JsonKey(ignore: true)
  _$$PhysicalActivityStateImplCopyWith<_$PhysicalActivityStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
