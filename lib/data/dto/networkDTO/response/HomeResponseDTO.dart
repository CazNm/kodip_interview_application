import 'package:sampl/data/dto/networkDTO/networkDTO/UserNetworkDTO.dart';
import 'package:sampl/data/dto/networkDTO/networkDTO/WalletNetworkDTO.dart';

class HomeResponseDTO {
  final UserNetworkDTO user;
  final List<WalletNetworkDTO> wallets;

  HomeResponseDTO({
    required this.user,
    required this.wallets
  });
}