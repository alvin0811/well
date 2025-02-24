// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cubit_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CubitMessage {
  Object get message => throw _privateConstructorUsedError;
  bool? get isError => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CubitMessages message, bool? isError) local,
    required TResult Function(String message, bool? isError) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CubitMessages message, bool? isError)? local,
    TResult? Function(String message, bool? isError)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CubitMessages message, bool? isError)? local,
    TResult Function(String message, bool? isError)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CubitMessageLocal value) local,
    required TResult Function(CubitMessageNetwork value) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CubitMessageLocal value)? local,
    TResult? Function(CubitMessageNetwork value)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CubitMessageLocal value)? local,
    TResult Function(CubitMessageNetwork value)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CubitMessageCopyWith<CubitMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CubitMessageCopyWith<$Res> {
  factory $CubitMessageCopyWith(
          CubitMessage value, $Res Function(CubitMessage) then) =
      _$CubitMessageCopyWithImpl<$Res, CubitMessage>;
  @useResult
  $Res call({bool? isError});
}

/// @nodoc
class _$CubitMessageCopyWithImpl<$Res, $Val extends CubitMessage>
    implements $CubitMessageCopyWith<$Res> {
  _$CubitMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isError = freezed,
  }) {
    return _then(_value.copyWith(
      isError: freezed == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CubitMessageLocalImplCopyWith<$Res>
    implements $CubitMessageCopyWith<$Res> {
  factory _$$CubitMessageLocalImplCopyWith(_$CubitMessageLocalImpl value,
          $Res Function(_$CubitMessageLocalImpl) then) =
      __$$CubitMessageLocalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CubitMessages message, bool? isError});
}

/// @nodoc
class __$$CubitMessageLocalImplCopyWithImpl<$Res>
    extends _$CubitMessageCopyWithImpl<$Res, _$CubitMessageLocalImpl>
    implements _$$CubitMessageLocalImplCopyWith<$Res> {
  __$$CubitMessageLocalImplCopyWithImpl(_$CubitMessageLocalImpl _value,
      $Res Function(_$CubitMessageLocalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isError = freezed,
  }) {
    return _then(_$CubitMessageLocalImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as CubitMessages,
      isError: freezed == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$CubitMessageLocalImpl implements CubitMessageLocal {
  _$CubitMessageLocalImpl({required this.message, this.isError = false});

  @override
  final CubitMessages message;
  @override
  @JsonKey()
  final bool? isError;

  @override
  String toString() {
    return 'CubitMessage.local(message: $message, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CubitMessageLocalImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CubitMessageLocalImplCopyWith<_$CubitMessageLocalImpl> get copyWith =>
      __$$CubitMessageLocalImplCopyWithImpl<_$CubitMessageLocalImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CubitMessages message, bool? isError) local,
    required TResult Function(String message, bool? isError) network,
  }) {
    return local(message, isError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CubitMessages message, bool? isError)? local,
    TResult? Function(String message, bool? isError)? network,
  }) {
    return local?.call(message, isError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CubitMessages message, bool? isError)? local,
    TResult Function(String message, bool? isError)? network,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(message, isError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CubitMessageLocal value) local,
    required TResult Function(CubitMessageNetwork value) network,
  }) {
    return local(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CubitMessageLocal value)? local,
    TResult? Function(CubitMessageNetwork value)? network,
  }) {
    return local?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CubitMessageLocal value)? local,
    TResult Function(CubitMessageNetwork value)? network,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(this);
    }
    return orElse();
  }
}

abstract class CubitMessageLocal implements CubitMessage {
  factory CubitMessageLocal(
      {required final CubitMessages message,
      final bool? isError}) = _$CubitMessageLocalImpl;

  @override
  CubitMessages get message;
  @override
  bool? get isError;
  @override
  @JsonKey(ignore: true)
  _$$CubitMessageLocalImplCopyWith<_$CubitMessageLocalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CubitMessageNetworkImplCopyWith<$Res>
    implements $CubitMessageCopyWith<$Res> {
  factory _$$CubitMessageNetworkImplCopyWith(_$CubitMessageNetworkImpl value,
          $Res Function(_$CubitMessageNetworkImpl) then) =
      __$$CubitMessageNetworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, bool? isError});
}

/// @nodoc
class __$$CubitMessageNetworkImplCopyWithImpl<$Res>
    extends _$CubitMessageCopyWithImpl<$Res, _$CubitMessageNetworkImpl>
    implements _$$CubitMessageNetworkImplCopyWith<$Res> {
  __$$CubitMessageNetworkImplCopyWithImpl(_$CubitMessageNetworkImpl _value,
      $Res Function(_$CubitMessageNetworkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isError = freezed,
  }) {
    return _then(_$CubitMessageNetworkImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isError: freezed == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$CubitMessageNetworkImpl implements CubitMessageNetwork {
  _$CubitMessageNetworkImpl({required this.message, this.isError = true});

  @override
  final String message;
  @override
  @JsonKey()
  final bool? isError;

  @override
  String toString() {
    return 'CubitMessage.network(message: $message, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CubitMessageNetworkImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CubitMessageNetworkImplCopyWith<_$CubitMessageNetworkImpl> get copyWith =>
      __$$CubitMessageNetworkImplCopyWithImpl<_$CubitMessageNetworkImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CubitMessages message, bool? isError) local,
    required TResult Function(String message, bool? isError) network,
  }) {
    return network(message, isError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CubitMessages message, bool? isError)? local,
    TResult? Function(String message, bool? isError)? network,
  }) {
    return network?.call(message, isError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CubitMessages message, bool? isError)? local,
    TResult Function(String message, bool? isError)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message, isError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CubitMessageLocal value) local,
    required TResult Function(CubitMessageNetwork value) network,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CubitMessageLocal value)? local,
    TResult? Function(CubitMessageNetwork value)? network,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CubitMessageLocal value)? local,
    TResult Function(CubitMessageNetwork value)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class CubitMessageNetwork implements CubitMessage {
  factory CubitMessageNetwork(
      {required final String message,
      final bool? isError}) = _$CubitMessageNetworkImpl;

  @override
  String get message;
  @override
  bool? get isError;
  @override
  @JsonKey(ignore: true)
  _$$CubitMessageNetworkImplCopyWith<_$CubitMessageNetworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
