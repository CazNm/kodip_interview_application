import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sampl/data/dto/localDTO/TransactionSummary.dart';
import 'package:sampl/data/enum/ErrorReason.dart';

part 'TransactionUiState.freezed.dart';

@freezed
class TransactionUiState with _$TransactionUiState {
  const factory TransactionUiState({
    required TransactionSummary? data,
    required TransactionState state
  }) = _TransactionUiState;
}

sealed class TransactionState {}

class TransactionInitialize extends TransactionState {}

class TransactionLoadingDone extends TransactionState {}

class TransactionError extends TransactionState {
  final ErrorReason errorReason;

  TransactionError({
    required this.errorReason
  });
}