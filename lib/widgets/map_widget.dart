import 'dart:async';

import 'package:bybus/models/rotas.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final Rotas rota;
  const MapWidget({Key? key, required this.rota}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MapWidgetState createState() => _MapWidgetState();
}

Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;
  int currentPositionIndex = 0;
  late Timer timer;

  // Defina a BitmapDescriptor para o ícone do marcador
  late BitmapDescriptor busIcon;

  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'lib/assets/icons8-bus-50.png',
    ).then((value) {
      setState(() {
        busIcon = value;
      });
    });
    updateMarkers(); // Inicialmente busca os dados
    // Configura um temporizador para atualizar os dados a cada 5 segundos
    timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      setState(() {
        currentPositionIndex =
            (currentPositionIndex + 1) % widget.rota.busPosition.length;
        mapController.animateCamera(CameraUpdate.newLatLng(
            widget.rota.busPosition[currentPositionIndex]));
      });
      updateMarkers();
    });

    // Carregue a imagem do ícone do marcador
  }

  @override
  void dispose() {
    // Cancela o temporizador quando o widget é removido da árvore de widgets
    timer.cancel();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> updateMarkers() async {
    const markerId = MarkerId('LocationMarker');
    final marker = Marker(
      markerId: markerId,
      icon: await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(5, 5)),
        'lib/assets/busao.png',
      ),
      infoWindow: const InfoWindow(title: "Coleira"),
      position: widget.rota.busPosition[currentPositionIndex],
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: widget.rota.busPosition.first, // Posição inicial do ônibus
        zoom: 18.0,
      ),
      markers: Set<Marker>.of(markers.values),
    );
  }
}
// {
//         Marker(
//           markerId: const MarkerId('busMarker'),
//           position: rota
//               .busPosition[currentPositionIndex], // Posição do ônibus
//           icon: busIcon, // Defina o ícone do marcador
//         ),
//       },