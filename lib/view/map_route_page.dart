// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bybus/enum/enum.dart';
import 'package:bybus/models/wallet.dart';
import 'package:bybus/services/wallet_services.dart';
import 'package:bybus/view/bus_page.dart';
import 'package:bybus/view/route_page.dart';
import 'package:bybus/widgets/balance_text.dart';
import 'package:bybus/widgets/primary_button.dart';
import 'package:bybus/widgets/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRoutePage extends StatefulWidget {
  final User user;
  final List<LatLng> rotas;
  const MapRoutePage({
    Key? key,
    required this.user,
    required this.rotas,
  }) : super(key: key);

  @override
  State<MapRoutePage> createState() => _MapPageState();
}

class _MapPageState extends State<MapRoutePage> {
  WalletService walletService = WalletService();
  final Rota rota = Rota();
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _map(),
            const SizedBox(height: 10),
            _title("Selecione um Ponto de ônibus no mapa"),
            _balance(),
            _timeText(),
            const SizedBox(height: 10.0),
            _payButton(context),
            _backButton(context),
          ],
        ),
      ),
    );
  }

  _map() {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: RoutePage(
        rotas: widget.rotas,
        user: widget.user,
      ),
    );
  }

  _balance() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: BalanceText(uid: widget.user.uid),
    );
  }

  List<LatLng> selecionarRota(String r) {
    switch (r) {
      case 'univali':
        return rota.balnearioUnivali.busPosition;

      case 'fazenda':
        return rota.cabecudas.busPosition;

      default:
        return rota.cabecudas.busPosition;
    }
  }

  _timeText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _title("Valor:"),
          const SizedBox(width: 50),
          _title("R\$5.00"),
        ],
      ),
    );
  }

  _title(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  _payment(double value, context) async {
    Wallet? wallet = await walletService.getWalletById(widget.user.uid);

    if (wallet != null) {
      double newBalance = double.parse(wallet.balance) - value;
      wallet.balance = newBalance.toString();
      await walletService.updateWalletBalance(
        walletId: wallet.id,
        newBalance: wallet.balance,
      );
      showSnackBar(
          context: context, mensagem: "Pagamento aprovado!", isErro: false);
    }
    setState(() {}); // Atualiza a UI
  }

  _payButton(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: SizedBox(
        height: 50,
        child: PrimaryButton(
          funds: false,
          color: AppColors.primary,
          onPressed: () {
            _payment(5, context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BusPage(
                  user: widget.user,
                  rotas: widget.rotas,
                ),
              ),
            );
          },
          text: "Prosseguir para a compra",
        ),
      ),
    );
  }

  _backButton(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: SizedBox(
          height: 50,
          child: PrimaryButton(
            funds: true,
            logoff: true,
            color: Colors.grey,
            text: "Voltar",
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/navpage',
              );
            },
          )),
    );
  }
}
