// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splashUiState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SplashUiState {
  SplashState get splashState => throw _privateConstructorUsedError;
  int get loadingStage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashUiStateCopyWith<SplashUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashUiStateCopyWith<$Res> {
  factory $SplashUiStateCopyWith(
          SplashUiState value, $Res Function(SplashUiState) then) =
      _$SplashUiStateCopyWithImpl<$Res, SplashUiState>;
  @useResult
  $Res call({SplashState splashState, int loadingStage});
}

/// @nodoc
class _$SplashUiStateCopyWithImpl<$Res, $Val extends SplashUiState>
    implements $SplashUiStateCopyWith<$Res> {
  _$SplashUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splashState = null,
    Object? loadingStage = null,
  }) {
    return _then(_value.copyWith(
      splashState: null == splashState
          ? _value.splashState
          : splashState // ignore: cast_nullable_to_non_nullable
              as SplashState,
      loadingStage: null == loadingStage
          ? _value.loadingStage
          : loadingStage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashUiStateImplCopyWith<$Res>
    implements $SplashUiStateCopyWith<$Res> {
  factory _$$SplashUiStateImplCopyWith(
          _$SplashUiStateImpl value, $Res Function(_$SplashUiStateImpl) then) =
      __$$SplashUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SplashState splashState, int loadingStage});
}

/// @nodoc
class __$$SplashUiStateImplCopyWithImpl<$Res>
    extends _$SplashUiStateCopyWithImpl<$Res, _$SplashUiStateImpl>
    implements _$$SplashUiStateImplCopyWith<$Res> {
  __$$SplashUiStateImplCopyWithImpl(
      _$SplashUiStateImpl _value, $Res Function(_$SplashUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splashState = null,
    Object? loadingStage = null,
  }) {
    return _then(_$SplashUiStateImpl(
      splashState: null == splashState
          ? _value.splashState
          : splashState // ignore: cast_nullable_to_non_nullable
              as SplashState,
      loadingStage: null == loadingStage
          ? _value.loadingStage
          : loadingStage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SplashUiStateImpl implements _SplashUiState {
  const _$SplashUiStateImpl(
      {required this.splashState, required this.loadingStage});

  @override
  final SplashState splashState;
  @override
  final int loadingStage;

  @override
  String toString() {
    return 'SplashUiState(splashState: $splashState, loadingStage: $loadingStage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashUiStateImpl &&
            (identical(other.splashState, splashState) ||
                other.splashState == splashState) &&
            (identical(other.loadingStage, loadingStage) ||
                other.loadingStage == loadingStage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, splashState, loadingStage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashUiStateImplCopyWith<_$SplashUiStateImpl> get copyWith =>
      __$$SplashUiStateImplCopyWithImpl<_$SplashUiStateImpl>(this, _$identity);
}

abstract class _SplashUiState implements SplashUiState {
  const factory _SplashUiState(
      {required final SplashState splashState,
      required final int loadingStage}) = _$SplashUiStateImpl;

  @override
  SplashState get splashState;
  @override
  int get loadingStage;
  @override
  @JsonKey(ignore: true)
  _$$SplashUiStateImplCopyWith<_$SplashUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
