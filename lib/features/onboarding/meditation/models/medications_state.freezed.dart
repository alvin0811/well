// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MeditationState {
  List<int> get medicationIds => throw _privateConstructorUsedError;
  MedicationListResponse get medicationListItems =>
      throw _privateConstructorUsedError;
  int? get medicationLevel => throw _privateConstructorUsedError;
  int? get activityLevel => throw _privateConstructorUsedError;
  bool get enableNext => throw _privateConstructorUsedError;
  bool get formFieldsDataMapped => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MeditationStateCopyWith<MeditationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeditationStateCopyWith<$Res> {
  factory $MeditationStateCopyWith(
          MeditationState value, $Res Function(MeditationState) then) =
      _$MeditationStateCopyWithImpl<$Res, MeditationState>;
  @useResult
  $Res call(
      {List<int> medicationIds,
      MedicationListResponse medicationListItems,
      int? medicationLevel,
      int? activityLevel,
      bool enableNext,
      bool formFieldsDataMapped});
}

/// @nodoc
class _$MeditationStateCopyWithImpl<$Res, $Val extends MeditationState>
    implements $MeditationStateCopyWith<$Res> {
  _$MeditationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicationIds = null,
    Object? medicationListItems = null,
    Object? medicationLevel = freezed,
    Object? activityLevel = freezed,
    Object? enableNext = null,
    Object? formFieldsDataMapped = null,
  }) {
    return _then(_value.copyWith(
      medicationIds: null == medicationIds
          ? _value.medicationIds
          : medicationIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      medicationListItems: null == medicationListItems
          ? _value.medicationListItems
          : medicationListItems // ignore: cast_nullable_to_non_nullable
              as MedicationListResponse,
      medicationLevel: freezed == medicationLevel
          ? _value.medicationLevel
          : medicationLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      activityLevel: freezed == activityLevel
          ? _value.activityLevel
          : activityLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      enableNext: null == enableNext
          ? _value.enableNext
          : enableNext // ignore: cast_nullable_to_non_nullable
              as bool,
      formFieldsDataMapped: null == formFieldsDataMapped
          ? _value.formFieldsDataMapped
          : formFieldsDataMapped // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeditationStateImplCopyWith<$Res>
    implements $MeditationStateCopyWith<$Res> {
  factory _$$MeditationStateImplCopyWith(_$MeditationStateImpl value,
          $Res Function(_$MeditationStateImpl) then) =
      __$$MeditationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<int> medicationIds,
      MedicationListResponse medicationListItems,
      int? medicationLevel,
      int? activityLevel,
      bool enableNext,
      bool formFieldsDataMapped});
}

/// @nodoc
class __$$MeditationStateImplCopyWithImpl<$Res>
    extends _$MeditationStateCopyWithImpl<$Res, _$MeditationStateImpl>
    implements _$$MeditationStateImplCopyWith<$Res> {
  __$$MeditationStateImplCopyWithImpl(
      _$MeditationStateImpl _value, $Res Function(_$MeditationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicationIds = null,
    Object? medicationListItems = null,
    Object? medicationLevel = freezed,
    Object? activityLevel = freezed,
    Object? enableNext = null,
    Object? formFieldsDataMapped = null,
  }) {
    return _then(_$MeditationStateImpl(
      medicationIds: null == medicationIds
          ? _value._medicationIds
          : medicationIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      medicationListItems: null == medicationListItems
          ? _value.medicationListItems
          : medicationListItems // ignore: cast_nullable_to_non_nullable
              as MedicationListResponse,
      medicationLevel: freezed == medicationLevel
          ? _value.medicationLevel
          : medicationLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      activityLevel: freezed == activityLevel
          ? _value.activityLevel
          : activityLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      enableNext: null == enableNext
          ? _value.enableNext
          : enableNext // ignore: cast_nullable_to_non_nullable
              as bool,
      formFieldsDataMapped: null == formFieldsDataMapped
          ? _value.formFieldsDataMapped
          : formFieldsDataMapped // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MeditationStateImpl extends _MeditationState {
  const _$MeditationStateImpl(
      {final List<int> medicationIds = const [],
      this.medicationListItems =
          const MedicationListResponse(medicationList: []),
      this.medicationLevel = 0,
      this.activityLevel = 0,
      this.enableNext = false,
      this.formFieldsDataMapped = false})
      : _medicationIds = medicationIds,
        super._();

  final List<int> _medicationIds;
  @override
  @JsonKey()
  List<int> get medicationIds {
    if (_medicationIds is EqualUnmodifiableListView) return _medicationIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicationIds);
  }

  @override
  @JsonKey()
  final MedicationListResponse medicationListItems;
  @override
  @JsonKey()
  final int? medicationLevel;
  @override
  @JsonKey()
  final int? activityLevel;
  @override
  @JsonKey()
  final bool enableNext;
  @override
  @JsonKey()
  final bool formFieldsDataMapped;

  @override
  String toString() {
    return 'MeditationState(medicationIds: $medicationIds, medicationListItems: $medicationListItems, medicationLevel: $medicationLevel, activityLevel: $activityLevel, enableNext: $enableNext, formFieldsDataMapped: $formFieldsDataMapped)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeditationStateImpl &&
            const DeepCollectionEquality()
                .equals(other._medicationIds, _medicationIds) &&
            (identical(other.medicationListItems, medicationListItems) ||
                other.medicationListItems == medicationListItems) &&
            (identical(other.medicationLevel, medicationLevel) ||
                other.medicationLevel == medicationLevel) &&
            (identical(other.activityLevel, activityLevel) ||
                other.activityLevel == activityLevel) &&
            (identical(other.enableNext, enableNext) ||
                other.enableNext == enableNext) &&
            (identical(other.formFieldsDataMapped, formFieldsDataMapped) ||
                other.formFieldsDataMapped == formFieldsDataMapped));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_medicationIds),
      medicationListItems,
      medicationLevel,
      activityLevel,
      enableNext,
      formFieldsDataMapped);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeditationStateImplCopyWith<_$MeditationStateImpl> get copyWith =>
      __$$MeditationStateImplCopyWithImpl<_$MeditationStateImpl>(
          this, _$identity);
}

abstract class _MeditationState extends MeditationState {
  const factory _MeditationState(
      {final List<int> medicationIds,
      final MedicationListResponse medicationListItems,
      final int? medicationLevel,
      final int? activityLevel,
      final bool enableNext,
      final bool formFieldsDataMapped}) = _$MeditationStateImpl;
  const _MeditationState._() : super._();

  @override
  List<int> get medicationIds;
  @override
  MedicationListResponse get medicationListItems;
  @override
  int? get medicationLevel;
  @override
  int? get activityLevel;
  @override
  bool get enableNext;
  @override
  bool get formFieldsDataMapped;
  @override
  @JsonKey(ignore: true)
  _$$MeditationStateImplCopyWith<_$MeditationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
