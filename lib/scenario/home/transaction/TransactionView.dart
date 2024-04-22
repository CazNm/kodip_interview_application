import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:sampl/scenario/home/transaction/TransactionScreen.dart';
import 'package:sampl/scenario/home/transaction/bloc/TransactionBloc.dart';
import 'package:sampl/util/ui/TopLevelView.dart';

class TransactionView extends TopLevelView {
  final int transactionId;

  const TransactionView({
    super.key,
    required this.transactionId
  });

  @override
  Widget child(BuildContext context) {
    return TransactionScreen(
      transactionId: transactionId,
    );
  }

  @override
  List<BlocProvider<TransactionBloc>> providers() {
    return [BlocProvider(create: (BuildContext context) => TransactionBloc())];
  }

}