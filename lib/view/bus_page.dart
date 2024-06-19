// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bybus/enum/enum.dart';
import 'package:bybus/models/rotas.dart';
import 'package:bybus/widgets/map_widget.dart';
import 'package:bybus/widgets/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusPage extends StatefulWidget {
  final User user;
  final List<LatLng> rotas;
  const BusPage({
    Key? key,
    required this.user,
    required this.rotas,
  }) : super(key: key);

  @override
  State<BusPage> createState() => _MapPageState();
}

class _MapPageState extends State<BusPage> {
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
            const SizedBox(height: 50.0),
            _title("Espere seu onibus chegar no seu ponto"),
            const SizedBox(height: 50.0),
            _payButton(context),
          ],
        ),
      ),
    );
  }

  _map() {
    Rotas rota = Rotas(
        id: "0",
        price: "price",
        busCode: "price",
        startTime: "price",
        endTime: "price",
        busPosition: widget.rotas);
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: MapWidget(rota: rota),
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
        height: 60,
        child: PrimaryButton(
          funds: false,
          color: AppColors.primary,
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/navpage',
            );
          },
          text: "Finalizar corrida",
        ),
      ),
    );
  }
}
