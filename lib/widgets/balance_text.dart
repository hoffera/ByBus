import 'package:bybus/enum/enum.dart';
import 'package:bybus/models/wallet.dart';
import 'package:bybus/services/wallet_services.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BalanceText extends StatelessWidget {
  String uid;
  BalanceText({super.key, required this.uid});
  WalletService walletService = WalletService();

  @override
  Widget build(BuildContext context) {
    return _saldo();
  }

  Future<Wallet?> _getWallet() async {
    return await walletService.getWalletById(uid);
  }

  Widget _saldo() {
    return FutureBuilder<Wallet?>(
      future: _getWallet(),
      builder: (BuildContext context, AsyncSnapshot<Wallet?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar saldo'));
        } else {
          Wallet? wallet = snapshot.data;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Saldo atual: ",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 1.0,
              ),
              Text(
                wallet != null ? "R\$ ${wallet.balance}" : "R\$ 0",
                style: const TextStyle(
                  fontSize: 32,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
