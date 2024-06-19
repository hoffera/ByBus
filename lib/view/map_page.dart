import 'package:bybus/enum/enum.dart';
import 'package:bybus/view/map_route_page.dart';
import 'package:bybus/widgets/balance_text.dart';
import 'package:bybus/widgets/drop_button.dart';
import 'package:bybus/widgets/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final User user;
  const MapPage({super.key, required this.user});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<LatLng> rotas = [];
  final Rota rota = Rota();
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    rotas = rota.cordeirosRessacada.busPosition;
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
            _goToText(),
            // _timeText(),
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
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: rotas.isNotEmpty ? rotas.first : const LatLng(0, 0),
          zoom: 14.0,
        ),
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            startCap: Cap.buttCap,
            jointType: JointType.round,
            points: rotas,
            color: Colors.red,
            width: 5,
          ),
        },
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
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

  _goToText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _title("Rota:"),
          const SizedBox(width: 10),
          DropButton(
            dropDownItems: const ["univali", "fazenda"],
            onSelected: (String selectedValue) {
              print(selectedValue);
              setState(() {
                rotas = selecionarRota(selectedValue);
              });
            },
          ),
        ],
      ),
    );
  }

  // _timeText() {
  //   return Padding(
  //     padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         _title("Hora:"),
  //         const SizedBox(width: 50),
  //         DropButton(
  //           dropDownItems: const ["12:00 - 13:00", "13:00"],
  //           onSelected: (String selectedValue) {
  //             print('O valor selecionado foi: $selectedValue');
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapRoutePage(
                  user: widget.user,
                  rotas: rotas,
                ),
              ),
            );
          },
          text: "Prosseguir para a compra",
        ),
      ),
    );
  }
}
