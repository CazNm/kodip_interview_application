import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampl/extenstions/IntExtension.dart';
import 'package:sampl/scenario/home/transaction/bloc/TransactionBloc.dart';
import 'package:sampl/scenario/home/transaction/bloc/uiState/TransactionUiState.dart';
import 'package:sampl/util/design/fixedSize.dart';
import 'package:sampl/util/design/paddingValue.dart';
import 'package:sampl/util/design/textClass.dart';
import 'package:sampl/util/ui/kodipLargeTabButton.dart';

import '../../../data/enum/PaymentType.dart';

class TransactionScreen extends StatefulWidget {
  final int transactionId;

  const TransactionScreen({
    super.key,
    required this.transactionId
  });

  @override
  State<StatefulWidget> createState() => _TransactionScreen();

}

class _TransactionScreen extends State<TransactionScreen> {
  late int transactionId;
  late TransactionBloc transactionBloc;

  @override
  void initState() {
    super.initState();
    transactionId = widget.transactionId;
    transactionBloc = BlocProvider.of<TransactionBloc>(context);
    transactionBloc.add(TransactionInitializeEvent(transactionId: transactionId));
  }

  void onClickButtonToClose() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BlocConsumer<TransactionBloc, TransactionUiState>(
        listener: (context, uiState){

        },
        builder: (context, uiState) {
          String paymentType = switch (uiState.data?.tr_type) {
            PaymentType.once => "일시불",
            PaymentType.installments => "할부",
            null => "-",
          };

          return  Container(
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
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(paddingMedium.toDouble()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextTitleMedium(text: uiState.data?.tr_title ?? "-"),
                      TextSmall(text: uiState.data?.tr_dt ?? "-")
                    ],
                  ),
                ),

                transactionItem(title: "결제금액", data: "${uiState.data?.tr_currency.name ?? "-"} ${uiState.data?.tr_amount.toCurrencyFormat() ?? "-"}"),
                transactionItem(title: "결제구분", data: paymentType),
                transactionItem(title: "결제카드", data: uiState.data == null ? "-" :"KODIP Platinum Card"),
                transactionItem(title: "승인번호", data: "${uiState.data?.tr_id ?? "-"}"),
                transactionItem(title: "승인상태", data: uiState.data == null ? "-" : "정상"),
                transactionItem(title: "가맹점 주소", data: uiState.data == null ? "-" : "서울 강남구 강남대로 374 케이스퀘어 강남2 18층"),

                kodipLargeTabButton("닫기", onClick: onClickButtonToClose)
              ],
            ),
          );
        }
    );
  }

  Widget transactionItem({
    required String title,
    required String data,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(paddingMedium.toDouble()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextTitleSmall(text: title),
          TextSmall(text: data)
        ],
      ),
    );
  }
}