import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sampl/data/enum/ErrorReason.dart';

part 'splashUiState.freezed.dart';


@freezed
class SplashUiState with _$SplashUiState {
  const factory SplashUiState({
    required SplashState splashState,
    required int loadingStage,
  }) = _SplashUiState;
}

sealed class SplashState {}

class SplashStateInitialize extends SplashState {}

class SplashStateCheckPermission extends SplashState {}

class SplashStateLogin extends SplashState {}

class SplashStateError extends SplashState {
  final ErrorReason errorReason;

  SplashStateError(this.errorReason);
}

class SplashStateSuccessful extends SplashState {}

