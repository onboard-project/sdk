import 'package:latlong2/latlong.dart';
import 'package:onboard_sdk/src/classes/stop/stop.class.dart';
import 'package:onboard_sdk/src/classes/waitingTime/waitingTime.class.dart';
import 'package:onboard_sdk/src/enums/linetype/linetype.enum.dart';

class Line {

  /// The unique identifier of the line and its direction
  String id;

  /// The code of the line
  String code;

  /// The direction of the line
  /// Can be [0] or [1]
  int direction;

  /// The line headcode, shown in stops, maps, PISs and vehicle boards.
  /// Not unique
  String headcode;

  /// The starting point of the line
  String start;

  /// The terminus point of the line
  String terminus;

  /// The line type of the line ([surface] for buses, trams and trolleybuses, [metro] for underground metro lines and [mela] for the light metro between Cascina Gobba M2 and the San Raffaele Hospital)
  LineType type;

  /// The stops of the line
  List<Stop?> stops;

  /// The geometry of the line
  List<Path?> geometry;

  /// The waiting time for this line, to be used only when [Line] is in [Stop.lines]
  WaitingTime waitingTime;

  Line({
    required this.id,
    required this.code,
    required this.direction,
    required this.headcode,
    required this.start,
    required this.terminus,
    required this.type,
    required this.stops,
    required this.geometry,
    this.waitingTime = const WaitingTime.none(),
  });


  /// Parses a line from a Map
  factory Line.fromJson(Map<String, dynamic> json) {
    final info = json['info'];
    final details = json["details"];

    final List<Stop?> stops = [];

    for (final stop in details['stops']) {
      stops.add(Stop.fromJson(stop));
    }

    final List<Path?> geometry = [];
    for (final path in details['geometry']) {
      final List<LatLng> segment = [];
      for (final point in path) {
        segment.add(LatLng(point['Y'], point['X']));
      }
      geometry.add(Path.from(segment));
    }
    
    final waitingTime = WaitingTime.fromJson(json['local']['waitingTime']);

    return Line(
      id: info['id'],
      code: info['code'],
      direction: int.tryParse(info['direction']) ?? 0,
      headcode: details['headCode'] ?? "",
      start: details['startPoint'] ?? "",
      terminus: details['endPoint'] ?? "",
      type: LineType.parse(details['vehicle'])!,
      stops: stops,
      geometry: geometry,
      waitingTime: waitingTime,
    );
  }
}
