// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stress_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StressState {
  List<CopingMechanism> get copingMechanismList =>
      throw _privateConstructorUsedError;
  List<StressItems>? get stressItems => throw _privateConstructorUsedError;
  List<int> get majorStressList => throw _privateConstructorUsedError;
  List<int> get copingMechanism => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StressStateCopyWith<StressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StressStateCopyWith<$Res> {
  factory $StressStateCopyWith(
          StressState value, $Res Function(StressState) then) =
      _$StressStateCopyWithImpl<$Res, StressState>;
  @useResult
  $Res call(
      {List<CopingMechanism> copingMechanismList,
      List<StressItems>? stressItems,
      List<int> majorStressList,
      List<int> copingMechanism});
}

/// @nodoc
class _$StressStateCopyWithImpl<$Res, $Val extends StressState>
    implements $StressStateCopyWith<$Res> {
  _$StressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? copingMechanismList = null,
    Object? stressItems = freezed,
    Object? majorStressList = null,
    Object? copingMechanism = null,
  }) {
    return _then(_value.copyWith(
      copingMechanismList: null == copingMechanismList
          ? _value.copingMechanismList
          : copingMechanismList // ignore: cast_nullable_to_non_nullable
              as List<CopingMechanism>,
      stressItems: freezed == stressItems
          ? _value.stressItems
          : stressItems // ignore: cast_nullable_to_non_nullable
              as List<StressItems>?,
      majorStressList: null == majorStressList
          ? _value.majorStressList
          : majorStressList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      copingMechanism: null == copingMechanism
          ? _value.copingMechanism
          : copingMechanism // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StressStateImplCopyWith<$Res>
    implements $StressStateCopyWith<$Res> {
  factory _$$StressStateImplCopyWith(
          _$StressStateImpl value, $Res Function(_$StressStateImpl) then) =
      __$$StressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CopingMechanism> copingMechanismList,
      List<StressItems>? stressItems,
      List<int> majorStressList,
      List<int> copingMechanism});
}

/// @nodoc
class __$$StressStateImplCopyWithImpl<$Res>
    extends _$StressStateCopyWithImpl<$Res, _$StressStateImpl>
    implements _$$StressStateImplCopyWith<$Res> {
  __$$StressStateImplCopyWithImpl(
      _$StressStateImpl _value, $Res Function(_$StressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? copingMechanismList = null,
    Object? stressItems = freezed,
    Object? majorStressList = null,
    Object? copingMechanism = null,
  }) {
    return _then(_$StressStateImpl(
      copingMechanismList: null == copingMechanismList
          ? _value._copingMechanismList
          : copingMechanismList // ignore: cast_nullable_to_non_nullable
              as List<CopingMechanism>,
      stressItems: freezed == stressItems
          ? _value._stressItems
          : stressItems // ignore: cast_nullable_to_non_nullable
              as List<StressItems>?,
      majorStressList: null == majorStressList
          ? _value._majorStressList
          : majorStressList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      copingMechanism: null == copingMechanism
          ? _value._copingMechanism
          : copingMechanism // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$StressStateImpl extends _StressState {
  const _$StressStateImpl(
      {final List<CopingMechanism> copingMechanismList = const [],
      final List<StressItems>? stressItems = const [
        StressItems(id: 0, title: "")
      ],
      final List<int> majorStressList = const [],
      final List<int> copingMechanism = const []})
      : _copingMechanismList = copingMechanismList,
        _stressItems = stressItems,
        _majorStressList = majorStressList,
        _copingMechanism = copingMechanism,
        super._();

  final List<CopingMechanism> _copingMechanismList;
  @override
  @JsonKey()
  List<CopingMechanism> get copingMechanismList {
    if (_copingMechanismList is EqualUnmodifiableListView)
      return _copingMechanismList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_copingMechanismList);
  }

  final List<StressItems>? _stressItems;
  @override
  @JsonKey()
  List<StressItems>? get stressItems {
    final value = _stressItems;
    if (value == null) return null;
    if (_stressItems is EqualUnmodifiableListView) return _stressItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int> _majorStressList;
  @override
  @JsonKey()
  List<int> get majorStressList {
    if (_majorStressList is EqualUnmodifiableListView) return _majorStressList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_majorStressList);
  }

  final List<int> _copingMechanism;
  @override
  @JsonKey()
  List<int> get copingMechanism {
    if (_copingMechanism is EqualUnmodifiableListView) return _copingMechanism;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_copingMechanism);
  }

  @override
  String toString() {
    return 'StressState(copingMechanismList: $copingMechanismList, stressItems: $stressItems, majorStressList: $majorStressList, copingMechanism: $copingMechanism)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StressStateImpl &&
            const DeepCollectionEquality()
                .equals(other._copingMechanismList, _copingMechanismList) &&
            const DeepCollectionEquality()
                .equals(other._stressItems, _stressItems) &&
            const DeepCollectionEquality()
                .equals(other._majorStressList, _majorStressList) &&
            const DeepCollectionEquality()
                .equals(other._copingMechanism, _copingMechanism));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_copingMechanismList),
      const DeepCollectionEquality().hash(_stressItems),
      const DeepCollectionEquality().hash(_majorStressList),
      const DeepCollectionEquality().hash(_copingMechanism));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StressStateImplCopyWith<_$StressStateImpl> get copyWith =>
      __$$StressStateImplCopyWithImpl<_$StressStateImpl>(this, _$identity);
}

abstract class _StressState extends StressState {
  const factory _StressState(
      {final List<CopingMechanism> copingMechanismList,
      final List<StressItems>? stressItems,
      final List<int> majorStressList,
      final List<int> copingMechanism}) = _$StressStateImpl;
  const _StressState._() : super._();

  @override
  List<CopingMechanism> get copingMechanismList;
  @override
  List<StressItems>? get stressItems;
  @override
  List<int> get majorStressList;
  @override
  List<int> get copingMechanism;
  @override
  @JsonKey(ignore: true)
  _$$StressStateImplCopyWith<_$StressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
