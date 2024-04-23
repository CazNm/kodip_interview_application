import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampl/data/dto/localDTO/CurrencyMap.dart';
import 'package:sampl/data/dto/networkDTO/response/CurrencyResponse.dart';
import 'package:sampl/data/enum/CurrencySymbol.dart';
import 'package:sampl/data/repository/task/TaskRepositoryClass.dart';
import 'package:sampl/data/repository/task/TaskRepositoryClassImpl.dart';
import 'package:sampl/scenario/home/currency/bloc/uiState/CurrencyUiState.dart';
import 'package:sampl/util/debugPrint.dart';

sealed class CurrencyEvent {}

final class CurrencyInitializeEvent extends CurrencyEvent {
  final CurrencySymbol symbol;

  CurrencyInitializeEvent({
    required this.symbol
  });
}

final class CurrencyError extends CurrencyEvent {}

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyUiState> {
  TaskRepositoryClass taskRepositoryClass = TaskRepositoryClassImpl();

  CurrencyBloc() : super(
    CurrencyUiState(
        currencyMap: null,
        state: CurrencyInitialize(),
    )
  ) {
    on<CurrencyInitializeEvent>((event, emit) async {
      await taskRepositoryClass.postCurrency(
          event.symbol,
          (CurrencyResponseDTO onSuccessResponse) async {
            for(var item in onSuccessResponse.currencyResponseMap.entries) {
              printHelper("time stamp is ${item.key} / currency value is ${item.value}");
            }

            emit(
              state.copyWith(
                currencyMap: CurrencyMap(currencyMap: onSuccessResponse.currencyResponseMap),
                state: CurrencyLoadingDone()
              )
            );
          },
          (String onFailMsg) async {

          });
    });

    on<CurrencyError>((event, emit) async {

    });
  }
}

