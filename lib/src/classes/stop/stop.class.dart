import 'package:latlong2/latlong.dart';
import 'package:onboard_sdk/src/classes/line/line.class.dart';
import 'package:onboard_sdk/src/enums/stoptype/stoptype.enum.dart';

class Stop {

  /// The unique ID for the stop
  String id;

  /// The name of the stop
  String name;

  /// The type of the stop ([surface], [metro] or [mela])
  StopType type;

  /// The location of the stop
  LatLng location;

  /// The lines that pass through the stop
  List<Line> lines;

  Stop({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.lines,
  });

  /// Parses a stop from a Map
  factory Stop.fromJson(Map<String, dynamic> json) {
    final List<Line> lines = [];

    if (json['lines'] != null && json['lines'] is List) {
      for (final line in json['lines']) {
        lines.add(Line.fromJson(line));
      }
    }

    return Stop(
      id: json['info']['id'],
      name: json['details']['name'],
      type: StopType.parse(json['details']['type']) ?? StopType.surface,
      location: LatLng(
        double.parse(json['location']['Y']),
        double.parse(json['location']['X']),
      ),
      lines: lines,
    );
  }
}
