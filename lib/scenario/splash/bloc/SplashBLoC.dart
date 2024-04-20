import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampl/data/repository/task/TaskRepositoryClassImpl.dart';
import 'package:sampl/scenario/splash/bloc/uiState/splashUiState.dart';

import '../../../data/repository/task/TaskRepositoryClass.dart';
import '../../../util/debugPrint.dart';

sealed class SplashEvent {}

final class SplashInitialize extends SplashEvent {}

class SplashBloc extends Bloc<SplashEvent, SplashUiState> {

    //Bloc 에서 이런식으로 Repository 를 주입해서 사용한다.
    TaskRepositoryClass taskRepository = TaskRepositoryClassImpl();

    SplashBloc() : super(
        const SplashUiState(
            splashState: SplashState.initialize,
            loadingStage: 0
        )
    ) {
      on<SplashInitialize> ((event, emit) async {
        emit(state.copyWith(splashState: SplashState.loading));
        /**
         * 여기에 시작에 필요한 모든 데이터를 가져와서 로딩합니다.
         * 로딩이 완료된다면, splashState -> successful 로 변경합니다.
         *
         * 중간에 error 가 발생한다면, splashState -> error 로 이행합니다.
         */

        await taskRepository.postLogin(
            (dynamic responseValue) async {
              printHelper("bloc initialize success with response $responseValue");
              for(int x = 0 ; x < 10 ; x++) {
                await Future.delayed(const Duration(milliseconds: 1000), (){
                  if(state.loadingStage < 100) {
                    SplashUiState uiState = state.copyWith(splashState: SplashState.loading, loadingStage: state.loadingStage + 50);
                    emit(uiState);
                  }

                  if(state.loadingStage >= 100) {
                    emit(state.copyWith(splashState: SplashState.successful));
                  }
                });
              }
              printHelper("bloc initialize success done");
            },
            (String onFail) async {
              printHelper("bloc initialize fail with $onFail");
            }
        );
        printHelper("bloc initialize event done");
      });
    }
    
    @override 
    void onChange(Change<SplashUiState> change) {
       super.onChange(change);
       printHelper(change.toString());
    }
}