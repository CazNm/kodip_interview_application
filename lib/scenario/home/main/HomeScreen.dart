import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampl/data/dto/localDTO/TransactionSummary.dart';
import 'package:sampl/data/dto/localDTO/User.dart';
import 'package:sampl/data/dto/localDTO/Wallet.dart';
import 'package:sampl/data/enum/CurrencySymbol.dart';
import 'package:sampl/data/enum/PaymentType.dart';
import 'package:sampl/extenstions/IntExtension.dart';
import 'package:sampl/extenstions/ListMapper.dart';
import 'package:sampl/navigationRoute/HomeRoute.dart';
import 'package:sampl/navigationRoute/SplashRoute.dart';
import 'package:sampl/scenario/home/main/bloc/HomeBloc.dart';
import 'package:sampl/scenario/home/main/bloc/uiState/HomeUiState.dart';
import 'package:sampl/util/customClass/StateWithLoading.dart';
import 'package:sampl/util/debugPrint.dart';
import 'package:sampl/util/design/color.dart';
import 'package:sampl/util/design/fixedSize.dart';
import 'package:sampl/util/design/paddingValue.dart';
import 'package:sampl/util/design/textClass.dart';
import 'package:sampl/util/toast/toastHelper.dart';
import 'package:sampl/util/ui/kodipLargeTabButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends StateWithOverlay<HomeScreen> {

  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();

    homeBloc = BlocProvider.of<HomeBloc>(context);
    HomeUiState homeUiState = homeBloc.state;
    switch(homeUiState.state) {
      case HomeInitialize() :
        homeBloc.add(HomeInitializeEvent());
        startLoadingOverlay();
        return;
      default :
        return;
    }
  }

  void onClickMore() {
    homeBloc.add(HomeRequestTransactionMore());
  }

  void moveToTransactionDetailView(int tr_id) {
    Navigator.of(context).pushNamed(
      HomeRoute.transaction,
      arguments: HomeRouteTransactionArgument(transactionId: tr_id)
    );
  }

  void moveToCurrencyDetailView(CurrencySymbol symbol) {
    Navigator.of(context).pushNamed(
      HomeRoute.currency,
      arguments: HomeRouteCurrencyArgument(currencySymbolEnum: symbol)
    );
  }

  @override
  Widget child(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeUiState>(
        listener: (context, state) {
          HomeUiState homeUiState = homeBloc.state;

          switch(homeUiState.state) {
            case HomeAPILoading() :
              homeBloc.add(HomeGetDataAPI());
              return;
            case HomeError() :
              stopLoading();
              var currentState = homeUiState.state as HomeError;
              showToast(context, msg: "ERROR OCCUR ${currentState.errorReason}");
              Navigator.pushNamedAndRemoveUntil(context, SplashRoute.init, (route) => false);
            default :
              stopLoading();
              return;
          }
        },
        builder: (BuildContext context, state) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(
                    height : MediaQuery.of(context).viewPadding.top
                ),
                SizedBox(
                  height: size36.toDouble(),
                ),
                userInfo(state.userInfo),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(paddingSmall.toDouble()),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: state.wallets.onMap((item) => walletItem(item, moveToCurrencyDetailView)),
                    ),
                  ),
                ),
                SizedBox(
                  height: size36.toDouble()
                ),

                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(paddingMedium.toDouble()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const TextTitleMedium(text: "거래내역"),
                            SizedBox(height: size4.toDouble()),
                            const TextSmall(text: "최장 180일 까지 조회됩니다. ")
                          ],
                        ),
                      ),
                      Expanded(flex: 1,
                       child: Column(
                         children: [
                           Expanded(child: MediaQuery.removePadding(
                               context: context,
                               removeTop : true,
                               child: ListView.builder(
                                 shrinkWrap: true,
                                 scrollDirection: Axis.vertical,
                                 itemBuilder: (context, index) => transactionItem(state.transactionSummaryList[index]),
                                 itemCount: state.transactionSummaryList.length,
                               )
                           ),),
                           kodipLargeTabButton(
                               "더보기",
                               showButton : state.hasNext,
                               onClick: onClickMore
                           )
                         ],
                       )
                     ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  Widget userInfo(User? userInfo) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(paddingMedium.toDouble()),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextTitleMedium(text: "내 지갑"),
          TextSmall(text: "${userInfo?.name ?? "-"} 고객님의 예수금은 ${userInfo?.deposit_amount.toCurrencyFormat()}원 입니다.")
        ],
      ),
    );
  }

  Widget walletItem (Wallet data, void Function(CurrencySymbol) onClickItem) {
    return GestureDetector(
      onTap: (){
        CurrencySymbol? currency = switch(data.currency) {
          "USD" => CurrencySymbol.USD,
          "KRW" => CurrencySymbol.KRW,
          "JPY" => CurrencySymbol.JPY,
          "MXN" => CurrencySymbol.MXN,
          "CNY" => CurrencySymbol.CNY,
          _ => null
        };

        printHelper("symbol is ${data.symbol} / $currency");
        if(currency != null) {
          onClickItem(currency);
        }
      },
      child: Container(
        width: size90.toDouble(),
        height: size120.toDouble(),
        decoration: BoxDecoration(
          color: colorBFFC49,
          borderRadius: BorderRadius.all(Radius.circular(size8.toDouble()))
        ),
        padding: EdgeInsets.fromLTRB(paddingLarge.toDouble(),0,paddingLarge.toDouble(),0),
        margin: EdgeInsets.all(paddingSmall.toDouble()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextTitleLarge(text: data.emoji),
            SizedBox(
              height: size4.toDouble()
            ),
            TextTitleLarge(text: data.currency),
            Row(
              children: [
                TextMediumSeoulNamsan(text: data.symbol),
                TextMedium(text: data.amount.toCurrencyFormat())
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget transactionItem(TransactionSummary data) {
    String paymentType = switch (data.tr_type) {
      PaymentType.once => "일시불",
      PaymentType.installments => "할부"
    };
    return GestureDetector(
      onTap: () {
        moveToTransactionDetailView(data.tr_id);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(paddingMedium.toDouble()),
        child: SizedBox(
          width: double.infinity,
          height: size36.toDouble(),
          child: Row(
            children: [
              kodipPng(),
              SizedBox(width: size8.toDouble()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextTitleSmall(text: data.tr_title),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - size120.toDouble(),
                      child: TextSmall(text: "$paymentType ${data.tr_currency.name} ${data.tr_amount.toCurrencyFormat()} ${data.tr_dt}"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget kodipPng() {
    const String kodipPngPath = "assets/image/kodipCircle.png";

    Widget kodipPngIcon = SizedBox(
        width: size36.toDouble(),
        height: size36.toDouble(),
        child: Image.asset(
          kodipPngPath,
          width: size36.toDouble(),
          height: size36.toDouble(),
        )
    );

    return kodipPngIcon;
  }


}