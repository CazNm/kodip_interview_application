# Kodip Readme

# Kodip interview application

---

## Plugin

- cbcplugin
- http
- freezed
- flutter_bloc
- permission_handler
- intl
- fl_chart

---

## 프로젝트 구조

### Application Arcitecture

- DataLayer
    - Datasource & RepositoryPattern
    - DataLayer Directory ( ( ./kodip_interview_application/lib/data/..)
        - dataSource
            - taskDatasource
        - dto
            - localDTO
            - networkDTO
                - response / networkDTO
        - enum
        - httpClient
            - localHttpClient
        - repository
            - taskRepository
- UiLayer
    - MVI  with BLoC
        - UiLayerPakage
            - navigationRoute ( ./kodip_interview_application/lib/navigationRoute/..)
            - scenario  ( ./kodip_interview_application/lib/scenario/..)
                - scenarioName
                    - bloc
                        - uiState
                            - scenarioUiState.dart
                            - scenarioUiState.freezed.dart
                        - scenarioBloc.dart
                    - scenarioScreen.dart
                    - scenarioView.dart

---

### Utilities ( ./kodip_interview_application/lib/util/..)

util/customClass

- CustomGestureDetector.dart
- StateWithLoading.dart
- TopLevelView.dart

util/design

- color.dart
- fixedSize.dart
- paddingValue.dart
- textClass.dart

util/toast

- toastHelper.dart

util/ui

- KodipBarChart.dart
- kodipLargeTabButton.dart

---

### Extensions  ( ./kodip_interview_application/lib/extensions/..)

- IntExtension
- ListMapper
- networkToLocal
- pxToDp

---

### 어플리케이션 기능 명세

- 오직 AndroidEmulator 에서만 동작합니다.
    - 실물 기기의 같은 wifi 연결의 경우 [localhost](http://localhost) 서버가 생성된 내부 ip 도메인 값을 읽어옴과 포트 개방 등의 작업이 필요하여 AndroidEmulator 가 localhost 에 접근하여 localhost 서버의 응답을 받아오도록 개발하였습니다.
- dark mode 를 지원합니다.
- 서버에러를 핸들링 합니다.
    - 403 에러 및 기타 **“200” Status** 를 반환하지 않는 서버 에러는 모두 SplashView 로 보내집니다.
    - TimeOut Error 가 있습니다. 최대 서버의 응답을 5초 까지 기다립니다. 이후 응답이 없을 경우 SplashView 로 보내집니다.
- home , transaction, currency 는 모두 서버의 응답 대기시 로딩 애니메이션이 구성되어 있습니다.
    - 로딩 중에는 화면 Interaction 이 불가능하며, 로딩 중에는 softBackButton 으로 이전 화면으로 돌아갈 수 있습니다.
    - home 에서의 softBackButton 은 어플리케이션이 종료됩니다.
        - 추가 하고 싶은 기능 :  1번 클릭시 경고, 2번 클릭시 종료 기능이 있으면 더 이상적이라고 생각합니다.
- currency 의 currency_graph 는 다음과 같은 Interaction 을 제공합니다.
    - 좌우 드래그
        - 좌우 드래그 시 currency_list 의 값들을 가져옵니다.
    - pinch Zoom
        - 확대/축소 를 지원합니다.
            - 확대 시 : 최소 3개의 데이터까지만 확대 됩니다.
            - 축소 시 : 최대 10개의 데이터까지만 리스트가 축소 됩니다.
    - tap
        - 한번 터치 시,
            - 리스트의 처음 아이템과 기본 확대값 스케일로 돌아옵니다.