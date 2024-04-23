// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CurrencyUiState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrencyUiState {
  CurrencyMap? get currencyMap => throw _privateConstructorUsedError;
  CurrencyState get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrencyUiStateCopyWith<CurrencyUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyUiStateCopyWith<$Res> {
  factory $CurrencyUiStateCopyWith(
          CurrencyUiState value, $Res Function(CurrencyUiState) then) =
      _$CurrencyUiStateCopyWithImpl<$Res, CurrencyUiState>;
  @useResult
  $Res call({CurrencyMap? currencyMap, CurrencyState state});
}

/// @nodoc
class _$CurrencyUiStateCopyWithImpl<$Res, $Val extends CurrencyUiState>
    implements $CurrencyUiStateCopyWith<$Res> {
  _$CurrencyUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyMap = freezed,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      currencyMap: freezed == currencyMap
          ? _value.currencyMap
          : currencyMap // ignore: cast_nullable_to_non_nullable
              as CurrencyMap?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as CurrencyState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyUiStateImplCopyWith<$Res>
    implements $CurrencyUiStateCopyWith<$Res> {
  factory _$$CurrencyUiStateImplCopyWith(_$CurrencyUiStateImpl value,
          $Res Function(_$CurrencyUiStateImpl) then) =
      __$$CurrencyUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CurrencyMap? currencyMap, CurrencyState state});
}

/// @nodoc
class __$$CurrencyUiStateImplCopyWithImpl<$Res>
    extends _$CurrencyUiStateCopyWithImpl<$Res, _$CurrencyUiStateImpl>
    implements _$$CurrencyUiStateImplCopyWith<$Res> {
  __$$CurrencyUiStateImplCopyWithImpl(
      _$CurrencyUiStateImpl _value, $Res Function(_$CurrencyUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyMap = freezed,
    Object? state = null,
  }) {
    return _then(_$CurrencyUiStateImpl(
      currencyMap: freezed == currencyMap
          ? _value.currencyMap
          : currencyMap // ignore: cast_nullable_to_non_nullable
              as CurrencyMap?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as CurrencyState,
    ));
  }
}

/// @nodoc

class _$CurrencyUiStateImpl implements _CurrencyUiState {
  const _$CurrencyUiStateImpl({required this.currencyMap, required this.state});

  @override
  final CurrencyMap? currencyMap;
  @override
  final CurrencyState state;

  @override
  String toString() {
    return 'CurrencyUiState(currencyMap: $currencyMap, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyUiStateImpl &&
            (identical(other.currencyMap, currencyMap) ||
                other.currencyMap == currencyMap) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currencyMap, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyUiStateImplCopyWith<_$CurrencyUiStateImpl> get copyWith =>
      __$$CurrencyUiStateImplCopyWithImpl<_$CurrencyUiStateImpl>(
          this, _$identity);
}

abstract class _CurrencyUiState implements CurrencyUiState {
  const factory _CurrencyUiState(
      {required final CurrencyMap? currencyMap,
      required final CurrencyState state}) = _$CurrencyUiStateImpl;

  @override
  CurrencyMap? get currencyMap;
  @override
  CurrencyState get state;
  @override
  @JsonKey(ignore: true)
  _$$CurrencyUiStateImplCopyWith<_$CurrencyUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
