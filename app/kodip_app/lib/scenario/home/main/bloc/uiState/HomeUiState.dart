import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sampl/data/dto/localDTO/TransactionSummary.dart';
import 'package:sampl/data/dto/localDTO/User.dart';
import 'package:sampl/data/dto/localDTO/Wallet.dart';
import 'package:sampl/data/dto/networkDTO/response/CurrencyResponse.dart';
import 'package:sampl/data/enum/ErrorReason.dart';

part 'HomeUiState.freezed.dart';

///  freezed 객체를 만들 때는 다음 처럼 정의 후
///
///  dart run build_runner build 를 호출해야합니다.
@freezed
class HomeUiState with _$HomeUiState {
  const factory HomeUiState({
    required User? userInfo,
    required List<Wallet> wallets,
    required List<TransactionSummary> transactionSummaryList,
    required int currentPage,
    required bool hasNext,
    required HomeState state,
  }) = _HomeUiState;
}

sealed class HomeState {}

class HomeInitialize extends HomeState {}

class HomeAPILoading extends HomeState {}

class HomeRequestMove extends HomeState {
  final String movingScreenEndPoint;
  final Map<String, dynamic>? argumentJson;

  HomeRequestMove({
    required this.movingScreenEndPoint,
    this.argumentJson
  });
}

class HomeLoadingDone extends HomeState {}

class HomeError extends HomeState {
  final ErrorReason errorReason;

  HomeError({
    required this.errorReason
  });
}