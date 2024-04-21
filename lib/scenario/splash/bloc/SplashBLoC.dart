import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sampl/data/dto/networkDTO/response/BaseResponseDTO.dart';
import 'package:sampl/data/enum/ErrorReason.dart';
import 'package:sampl/data/repository/task/TaskRepositoryClassImpl.dart';
import 'package:sampl/scenario/splash/bloc/uiState/splashUiState.dart';

import '../../../data/repository/task/TaskRepositoryClass.dart';
import '../../../util/debugPrint.dart';


sealed class SplashEvent {}

final class SplashInitialize extends SplashEvent {}

final class SplashPermissionCheck extends SplashEvent {}

final class SplashLoginAPI extends SplashEvent {}

final class SplashOnError extends SplashEvent {}

final class SplashOnSuccess extends SplashEvent {}

class SplashBloc extends Bloc<SplashEvent, SplashUiState> {

    //Bloc 에서 이런식으로 Repository 를 주입해서 사용한다.
    TaskRepositoryClass taskRepository = TaskRepositoryClassImpl();

    SplashBloc() : super(
         SplashUiState(
            splashState: SplashStateInitialize as SplashState,
            loadingStage: 0
        )
    ) {
      /**
       * Splash Scenario 가 처음 시작 될 때의 상태 2초를 기다리고 권한 체크 로직을 수행하도록 합니다.
       */
      on<SplashInitialize> ((event, emit) async {
        await Future.delayed(const Duration(milliseconds: 2000), () {});
        emit(state.copyWith(splashState: SplashStateCheckPermission as SplashState));

      });

      /**
       * 권한 체크 이벤트 실행
       *
       * 권한 체크가 정상적으로 이루어 졌을 경우에 로그인 로직을 실행합니다.
       *
       * 실패 시에 onError 이벤트를 실행하도록 합니다.
       */
      on<SplashPermissionCheck>((event, emit) async {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.location,
          Permission.camera,
        ].request();
        printHelper(statuses[Permission.location].toString());
        printHelper(statuses[Permission.camera].toString());
      });

      /**
       * 로그인 Api 동작 수행
       *
       * 로그인 동작이 정상적으로 수행되었을 경우 OnSuccess 로직을 실행 합니다.
       *
       * 실패 시에 onError 이벤트를 실행하도록 합니다.
       */
      on<SplashLoginAPI>((event, emit) async {
        /**
         * 여기에 시작에 필요한 모든 데이터를 가져와서 로딩합니다.
         * 로딩이 완료된다면, splashState -> successful 로 변경합니다.
         *
         * 중간에 error 가 발생한다면, splashState -> error 로 이행합니다.
         */
        await taskRepository.postLogin(
                (BaseResponseDTO responseValue) async {
                  if(responseValue.result == "success") {
                    emit(state.copyWith(splashState: SplashStateSuccessful as SplashState, loadingStage: state.loadingStage + 50));
                  } else {
                    emit(state.copyWith(splashState: SplashStateError(ErrorReason.API_EXCEPTION) as SplashState));
                  }
                },
                (String onFail) async {
                  emit(state.copyWith(splashState: SplashStateError(ErrorReason.API_EXCEPTION) as SplashState));
                }
        );
      });

      /**
       * Splash Event 를 수행 중에 Error 를 받을 경우 수행하는 로직입니다.
       *
       * 토스트 노출 후 어플리케이션을 종료 합니다.
       *
       * 에러 종류는 다음과 같습니다.
       *
       * 네트워크 연결 체크, Api 통신 실패, 내부 로직 수행 중 에러 발생.
       *
       * 네트워크 연결 체크 시 팝업 노출 후 확인을 누르면 어플을 종료합니다.
       *
       * API 통신 실패, 내부로직 수행 중 에러는 토스트 노출 후 1초 뒤 앱을 종료합니다.
       */
      on<SplashOnError>((event, emit) async {
        switch(state.splashState) {
          case SplashStateError() :
            SplashStateError errorState = state.splashState as SplashStateError;
            printHelper("setLogic wit State Error reason ${errorState.errorReason}");
          default :
            throw Exception("on Error SplashState must be ErrorState");
        }
      });

      /**
       * Splash의 모든 과정이 수행 완료 되었을 때의 로직입니다.
       *
       * Home Scenario 로 이동합니다.
       */
      on<SplashOnSuccess>((event, emit) async{

      });
    }
    
    @override 
    void onChange(Change<SplashUiState> change) {
       super.onChange(change);
       printHelper(change.toString());
    }
}