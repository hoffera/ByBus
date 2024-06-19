// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bybus/enum/enum.dart';
import 'package:bybus/view/route_page.dart';
import 'package:bybus/widgets/balance_text.dart';
import 'package:bybus/widgets/primary_button.dart';
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
            _balance(),
            _timeText(),
            const SizedBox(height: 10.0),
            _payButton(context),
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

  _payButton(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: SizedBox(
        height: 50,
        child: PrimaryButton(
          funds: false,
          color: AppColors.primary,
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/routepage',
            );
          },
          text: "Prosseguir para a compra",
        ),
      ),
    );
  }
}
