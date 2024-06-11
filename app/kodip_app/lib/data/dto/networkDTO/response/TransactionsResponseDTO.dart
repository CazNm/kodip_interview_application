import 'package:sampl/data/dto/networkDTO/networkDTO/TransactionSummaryNetworkDTO.dart';
import 'package:sampl/data/dto/networkDTO/networkDTO/UserNetworkDTO.dart';
import 'package:sampl/data/dto/networkDTO/networkDTO/WalletNetworkDTO.dart';

class TransactionsResponseDTO {
  final List<TransactionSummaryNetworkDTO> transactions;
  final bool next;

  TransactionsResponseDTO({
    required this.transactions,
    required this.next
  });
}