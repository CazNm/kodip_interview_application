import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampl/data/dto/localDTO/TransactionSummary.dart';
import 'package:sampl/data/dto/localDTO/Wallet.dart';
import 'package:sampl/data/dto/networkDTO/response/HomeResponseDTO.dart';
import 'package:sampl/data/dto/networkDTO/response/TransactionsResponseDTO.dart';
import 'package:sampl/data/enum/ErrorReason.dart';
import 'package:sampl/data/repository/task/TaskRepositoryClass.dart';
import 'package:sampl/data/repository/task/TaskRepositoryClassImpl.dart';
import 'package:sampl/extenstions/ListMapper.dart';
import 'package:sampl/extenstions/networkToLocal.dart';
import 'package:sampl/scenario/home/main/bloc/uiState/HomeUiState.dart';
import 'package:sampl/util/debugPrint.dart';

sealed class HomeEvent {}

final class HomeInitializeEvent extends HomeEvent {}

final class HomeGetDataAPI extends HomeEvent {}

final class HomeRequestMoveToCurrency extends HomeEvent {}

final class HomeRequestTransactionDetail extends HomeEvent {}

final class HomeRequestTransactionMore extends HomeEvent {}

final class HomeErrorEvent extends HomeEvent {}

class HomeBloc extends Bloc<HomeEvent, HomeUiState> {
  
  TaskRepositoryClass taskRepositoryClass = TaskRepositoryClassImpl();

  HomeBloc() : super(
    HomeUiState(
        userInfo: null,
        wallets: List.empty(),
        transactionSummaryList: List.empty(),
        hasNext: false,
        currentPage: 0,
        state: HomeInitialize()
    )
  ) {
    /**
     * 유저 정보를 가져옵니다.
     */
    on<HomeInitializeEvent>((event, emit) async {
      await taskRepositoryClass.postHome(
          (HomeResponseDTO onSuccessResponse) async {
            var walletList = onSuccessResponse.wallets.onMap<Wallet>((networkWallet) {
              return Wallet(
                currency: networkWallet.currency,
                symbol: networkWallet.symbol,
                emoji: networkWallet.emoji,
                amount: networkWallet.amount
              );
            });

            emit(
              state.copyWith(
                  userInfo : onSuccessResponse.user.toLocalDTO(),
                  wallets: walletList,
                  state: HomeAPILoading(),
              )
            );
          },
          (String failMsg) async {

          }
      );
    });


    /**
     * transaction 의 정보를 가져 옵니다.
     */
    on<HomeGetDataAPI>((event, emit) async {
      await taskRepositoryClass.postTransactions(
        state.currentPage,
        (TransactionsResponseDTO onSuccessResponse) async {
          printHelper("transaction list count : ${onSuccessResponse.transactions[0].tr_title}");
          emit(
            state.copyWith(
              state: HomeLoadingDone(),
              transactionSummaryList: onSuccessResponse.transactions.onMap((item) => item.toLocalDTO()),
              hasNext: onSuccessResponse.next,
            )
          );
        },
        (String failMsg) async {
          emit(state.copyWith(
              state: HomeError(errorReason: ErrorReason.API_EXCEPTION)
          ));
        });
    });

    /**
     * currency 화면으로의 이동 전의 데이터를 호출합니다. 네비게이터에 데이터를 넘겨줍니다.
     */
    on<HomeRequestMoveToCurrency>((event, emit) {

    });

    /**
     * Transaction 의 디테일 화면으로 이동합니다.
     */
    on<HomeRequestTransactionDetail>((event, emit) {

    });

    /**
     * Transactoin 의 더보기가 활성화가 되어 있다면, 추가 데이터를 가져 옵니다.
     */
    on<HomeRequestTransactionMore>((event, emit) async {
      var nextPage = state.currentPage + 1;
      printHelper("current page is $nextPage");
      await taskRepositoryClass.postTransactions(
          nextPage,
          (TransactionsResponseDTO onSuccessResponse) async {
            printHelper("has next? ${onSuccessResponse.next}");
            var stateList = state.transactionSummaryList.onMap((item) => item);

            onSuccessResponse.transactions.onMap((item){
              stateList.add(item.toLocalDTO());
              return;
            });

            emit(
                state.copyWith(
                  currentPage: nextPage,
                  state: HomeLoadingDone(),
                  transactionSummaryList: stateList,
                  hasNext: onSuccessResponse.next,
                )
            );
          },
          (String failMsg) async {

          }
      );
    });

    on<HomeErrorEvent>((event, emit){

    });

  }

  @override
  void onChange(Change<HomeUiState> change) {
    super.onChange(change);
    printHelper(change.toString());
  }
}