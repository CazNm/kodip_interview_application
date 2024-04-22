import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampl/data/dto/networkDTO/networkDTO/TransactionSummaryNetworkDTO.dart';
import 'package:sampl/data/repository/task/TaskRepositoryClass.dart';
import 'package:sampl/data/repository/task/TaskRepositoryClassImpl.dart';
import 'package:sampl/extenstions/networkToLocal.dart';
import 'package:sampl/scenario/home/transaction/bloc/uiState/TransactionUiState.dart';

sealed class TransactionEvent {}

final class TransactionInitializeEvent extends TransactionEvent {
  final int transactionId;

  TransactionInitializeEvent({
    required this.transactionId
  });
}

final class TransactionError extends TransactionEvent {}

class TransactionBloc extends Bloc<TransactionEvent , TransactionUiState> {

  TaskRepositoryClass taskRepositoryClass = TaskRepositoryClassImpl();

  TransactionBloc() : super(
    TransactionUiState(
        data: null,
        state: TransactionInitialize()
    )
  ) {
    /**
     * transaction info 를 가져옵니다.
     */
    on<TransactionInitializeEvent>((event, emit) async {
      await taskRepositoryClass.postTransaction(
          event.transactionId,
          (TransactionSummaryNetworkDTO response) async {
            emit(
                state.copyWith(
                  data: response.toLocalDTO(),
                  state: TransactionLoadingDone()
                )
            );
          },
          (String onFailMsg) async{

          }
      );
    });

    on<TransactionError>((event, emit) async {

    });
  }
}