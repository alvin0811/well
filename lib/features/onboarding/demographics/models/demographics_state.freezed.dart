// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'demographics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DemographicState {
  GenderStatus get genderStatus => throw _privateConstructorUsedError;
  FormFieldState get dateOfBirth => throw _privateConstructorUsedError;
  EthnicityStatus get ethnicities => throw _privateConstructorUsedError;
  bool get enableNext => throw _privateConstructorUsedError;
  bool get formFieldsDataMapped => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DemographicStateCopyWith<DemographicState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemographicStateCopyWith<$Res> {
  factory $DemographicStateCopyWith(
          DemographicState value, $Res Function(DemographicState) then) =
      _$DemographicStateCopyWithImpl<$Res, DemographicState>;
  @useResult
  $Res call(
      {GenderStatus genderStatus,
      FormFieldState dateOfBirth,
      EthnicityStatus ethnicities,
      bool enableNext,
      bool formFieldsDataMapped});

  $FormFieldStateCopyWith<$Res> get dateOfBirth;
}

/// @nodoc
class _$DemographicStateCopyWithImpl<$Res, $Val extends DemographicState>
    implements $DemographicStateCopyWith<$Res> {
  _$DemographicStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genderStatus = null,
    Object? dateOfBirth = null,
    Object? ethnicities = null,
    Object? enableNext = null,
    Object? formFieldsDataMapped = null,
  }) {
    return _then(_value.copyWith(
      genderStatus: null == genderStatus
          ? _value.genderStatus
          : genderStatus // ignore: cast_nullable_to_non_nullable
              as GenderStatus,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as FormFieldState,
      ethnicities: null == ethnicities
          ? _value.ethnicities
          : ethnicities // ignore: cast_nullable_to_non_nullable
              as EthnicityStatus,
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

  @override
  @pragma('vm:prefer-inline')
  $FormFieldStateCopyWith<$Res> get dateOfBirth {
    return $FormFieldStateCopyWith<$Res>(_value.dateOfBirth, (value) {
      return _then(_value.copyWith(dateOfBirth: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DemographicStateImplCopyWith<$Res>
    implements $DemographicStateCopyWith<$Res> {
  factory _$$DemographicStateImplCopyWith(_$DemographicStateImpl value,
          $Res Function(_$DemographicStateImpl) then) =
      __$$DemographicStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GenderStatus genderStatus,
      FormFieldState dateOfBirth,
      EthnicityStatus ethnicities,
      bool enableNext,
      bool formFieldsDataMapped});

  @override
  $FormFieldStateCopyWith<$Res> get dateOfBirth;
}

/// @nodoc
class __$$DemographicStateImplCopyWithImpl<$Res>
    extends _$DemographicStateCopyWithImpl<$Res, _$DemographicStateImpl>
    implements _$$DemographicStateImplCopyWith<$Res> {
  __$$DemographicStateImplCopyWithImpl(_$DemographicStateImpl _value,
      $Res Function(_$DemographicStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genderStatus = null,
    Object? dateOfBirth = null,
    Object? ethnicities = null,
    Object? enableNext = null,
    Object? formFieldsDataMapped = null,
  }) {
    return _then(_$DemographicStateImpl(
      genderStatus: null == genderStatus
          ? _value.genderStatus
          : genderStatus // ignore: cast_nullable_to_non_nullable
              as GenderStatus,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as FormFieldState,
      ethnicities: null == ethnicities
          ? _value.ethnicities
          : ethnicities // ignore: cast_nullable_to_non_nullable
              as EthnicityStatus,
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

class _$DemographicStateImpl extends _DemographicState {
  const _$DemographicStateImpl(
      {this.genderStatus = GenderStatus.male,
      this.dateOfBirth = const FormFieldState(),
      this.ethnicities = EthnicityStatus.white,
      this.enableNext = false,
      this.formFieldsDataMapped = false})
      : super._();

  @override
  @JsonKey()
  final GenderStatus genderStatus;
  @override
  @JsonKey()
  final FormFieldState dateOfBirth;
  @override
  @JsonKey()
  final EthnicityStatus ethnicities;
  @override
  @JsonKey()
  final bool enableNext;
  @override
  @JsonKey()
  final bool formFieldsDataMapped;

  @override
  String toString() {
    return 'DemographicState(genderStatus: $genderStatus, dateOfBirth: $dateOfBirth, ethnicities: $ethnicities, enableNext: $enableNext, formFieldsDataMapped: $formFieldsDataMapped)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DemographicStateImpl &&
            (identical(other.genderStatus, genderStatus) ||
                other.genderStatus == genderStatus) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.ethnicities, ethnicities) ||
                other.ethnicities == ethnicities) &&
            (identical(other.enableNext, enableNext) ||
                other.enableNext == enableNext) &&
            (identical(other.formFieldsDataMapped, formFieldsDataMapped) ||
                other.formFieldsDataMapped == formFieldsDataMapped));
  }

  @override
  int get hashCode => Object.hash(runtimeType, genderStatus, dateOfBirth,
      ethnicities, enableNext, formFieldsDataMapped);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DemographicStateImplCopyWith<_$DemographicStateImpl> get copyWith =>
      __$$DemographicStateImplCopyWithImpl<_$DemographicStateImpl>(
          this, _$identity);
}

abstract class _DemographicState extends DemographicState {
  const factory _DemographicState(
      {final GenderStatus genderStatus,
      final FormFieldState dateOfBirth,
      final EthnicityStatus ethnicities,
      final bool enableNext,
      final bool formFieldsDataMapped}) = _$DemographicStateImpl;
  const _DemographicState._() : super._();

  @override
  GenderStatus get genderStatus;
  @override
  FormFieldState get dateOfBirth;
  @override
  EthnicityStatus get ethnicities;
  @override
  bool get enableNext;
  @override
  bool get formFieldsDataMapped;
  @override
  @JsonKey(ignore: true)
  _$$DemographicStateImplCopyWith<_$DemographicStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
