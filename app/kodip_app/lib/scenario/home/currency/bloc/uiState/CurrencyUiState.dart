import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sampl/data/dto/localDTO/CurrencyMap.dart';
import 'package:sampl/data/enum/ErrorReason.dart';

part 'CurrencyUiState.freezed.dart';

@freezed
class CurrencyUiState with _$CurrencyUiState {
  const factory CurrencyUiState({
    required CurrencyMap? currencyMap,
    required CurrencyState state
  }) = _CurrencyUiState;
}

sealed class CurrencyState{}

class CurrencyInitialize extends CurrencyState {}

class CurrencyLoadingDone extends CurrencyState {}

class CurrencyError extends CurrencyState {
  final ErrorReason errorReason;

  CurrencyError({
    required this.errorReason
  });
}