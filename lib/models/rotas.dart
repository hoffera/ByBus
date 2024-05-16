import 'package:deep_pick/deep_pick.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Rotas {
  final String id;
  final String price;
  final String busCode;
  final String startTime;
  final String endTime;
  final List<LatLng> busPosition;

  Rotas({
    required this.id,
    required this.price,
    required this.busCode,
    required this.startTime,
    required this.endTime,
    required this.busPosition,
  });

  factory Rotas.fromJson(Map<String, dynamic> json) {
    return Rotas(
        id: pick(json, "id").asStringOrThrow(),
        price: pick(json, "price").asStringOrThrow(),
        busCode: pick(json, "busCode").asStringOrThrow(),
        startTime: pick(json, "startTime").asStringOrThrow(),
        endTime: pick(json, "endTime").asStringOrThrow(),
        busPosition: []);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'busCode': busCode,
      'startTime': startTime,
      'endTime': endTime,
      'busPosition': busPosition.map((position) => position.toJson()).toList(),
    };
  }
}
/*
final univali_univali = Rotas(
    id: '1',
    startPosition: 'Univali Itajaí',
    endPosition: 'Univali Balneário Camboriú',
    price: '20',
    busCode: 'X123',
    startTime: '09:00',
    endTime: '10:00',
    busPositions: [
      Lating(-26.914680798734743, -48.66320286865043),
      Lating(-26.919193835456685, -48.65429984780385),
      Lating(-26.9941236702108, -48.64768600071914),
      Lating(-27.005041676442264, -48.63394857306774),
    ],
  );

  final univali_rodoviaria = Rotas(
    id: '2',
    startPosition: 'Univali Itajaí',
    endPosition: 'Terminal Rodoviário de Itjaí',
    price: '15',
    busCode: 'Y456',
    startTime: '11:00',
    endTime: '13:00',
    busPositions: [
      Lating(-26.914680798734743, -48.66320286865043),
      Lating(-26.90754947738048, -48.65884687190425),
      Lating(-26.903293719117436, -48.656955917804694),
      Lating(-26.91438319112388, -48.69432519391949),
    ],
  );
*/