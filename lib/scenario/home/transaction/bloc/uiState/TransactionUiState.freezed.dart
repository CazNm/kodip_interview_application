// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TransactionUiState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionUiState {
  TransactionSummary? get data => throw _privateConstructorUsedError;
  TransactionState get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionUiStateCopyWith<TransactionUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionUiStateCopyWith<$Res> {
  factory $TransactionUiStateCopyWith(
          TransactionUiState value, $Res Function(TransactionUiState) then) =
      _$TransactionUiStateCopyWithImpl<$Res, TransactionUiState>;
  @useResult
  $Res call({TransactionSummary? data, TransactionState state});
}

/// @nodoc
class _$TransactionUiStateCopyWithImpl<$Res, $Val extends TransactionUiState>
    implements $TransactionUiStateCopyWith<$Res> {
  _$TransactionUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TransactionSummary?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionUiStateImplCopyWith<$Res>
    implements $TransactionUiStateCopyWith<$Res> {
  factory _$$TransactionUiStateImplCopyWith(_$TransactionUiStateImpl value,
          $Res Function(_$TransactionUiStateImpl) then) =
      __$$TransactionUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TransactionSummary? data, TransactionState state});
}

/// @nodoc
class __$$TransactionUiStateImplCopyWithImpl<$Res>
    extends _$TransactionUiStateCopyWithImpl<$Res, _$TransactionUiStateImpl>
    implements _$$TransactionUiStateImplCopyWith<$Res> {
  __$$TransactionUiStateImplCopyWithImpl(_$TransactionUiStateImpl _value,
      $Res Function(_$TransactionUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? state = null,
  }) {
    return _then(_$TransactionUiStateImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TransactionSummary?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionState,
    ));
  }
}

/// @nodoc

class _$TransactionUiStateImpl implements _TransactionUiState {
  const _$TransactionUiStateImpl({required this.data, required this.state});

  @override
  final TransactionSummary? data;
  @override
  final TransactionState state;

  @override
  String toString() {
    return 'TransactionUiState(data: $data, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionUiStateImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionUiStateImplCopyWith<_$TransactionUiStateImpl> get copyWith =>
      __$$TransactionUiStateImplCopyWithImpl<_$TransactionUiStateImpl>(
          this, _$identity);
}

abstract class _TransactionUiState implements TransactionUiState {
  const factory _TransactionUiState(
      {required final TransactionSummary? data,
      required final TransactionState state}) = _$TransactionUiStateImpl;

  @override
  TransactionSummary? get data;
  @override
  TransactionState get state;
  @override
  @JsonKey(ignore: true)
  _$$TransactionUiStateImplCopyWith<_$TransactionUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
