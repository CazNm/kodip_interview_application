import 'package:freezed_annotation/freezed_annotation.dart';

part 'splashUiState.freezed.dart';


@freezed
class SplashUiState with _$SplashUiState {
  const factory SplashUiState({
    required SplashState splashState,
    required int loadingStage,
  }) = _SplashUiState;
}

enum SplashState {
  initialize,
  loading,
  error,
  successful,
}