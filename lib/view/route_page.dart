import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RoutePage extends StatefulWidget {
  final List<LatLng> rotas;
  final User user;

  const RoutePage({Key? key, required this.rotas, required this.user})
      : super(key: key);

  @override
  _AllMarkersMapWidgetState createState() => _AllMarkersMapWidgetState();
}

class _AllMarkersMapWidgetState extends State<RoutePage> {
  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers = {};

  @override
  void initState() {
    super.initState();
    // Inicializa os marcadores
    setMarkers();
  }

  @override
  void didUpdateWidget(covariant RoutePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.rotas != oldWidget.rotas) {
      setMarkers();
      updateMapPosition();
    }
  }

  void updateMapPosition() {
    if (widget.rotas.isNotEmpty) {
      mapController.animateCamera(
        CameraUpdate.newLatLngZoom(widget.rotas.first, 12.0),
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void setMarkers() async {
    markers.clear(); // Limpa os marcadores existentes
    for (int i = 0; i < widget.rotas.length; i++) {
      final markerId = MarkerId('Marker_$i');
      final marker = Marker(
        markerId: markerId,
        position: widget.rotas[i],
        infoWindow: InfoWindow(title: 'Posição $i'),
        // icon: await BitmapDescriptor.fromAssetImage(
        //   const ImageConfiguration(),
        //   'lib/assets/busao.png', // Certifique-se de que este caminho é correto
        // ),
        onTap: () {
          final position = widget.rotas[i];
          print('Marcador $position clicado!');
        },
      );

      setState(() {
        markers[markerId] = marker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target:
              widget.rotas.isNotEmpty ? widget.rotas.first : const LatLng(0, 0),
          zoom: 12.0,
        ),
        markers: Set<Marker>.of(markers.values),
      ),
    );
  }
}
