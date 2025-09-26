import 'package:onboard_sdk/onboard_sdk.dart';
import 'package:onboard_sdk/src/enums/metroline/metroline.enum.dart';

class MetroStatus {
  /// The unique ID for the stop
  List<LineStatus> lines;

  /// The name of the stop
  String message;

  MetroStatus({required this.lines, required this.message});

  bool regular() {
    bool isOK = true;
    for (final line in lines) {
      if (line.status != "Regolare") {
        isOK = false;
      }
    }
    return isOK;
  }

  /// Parses a stop from a Map
  factory MetroStatus.fromJson(Map<String, dynamic> json) {
    final List<LineStatus> lines = [];

    if (json['lines'] != null && json['lines'] is List) {
      for (final line in json['lines']) {
        lines.add(LineStatus.fromJson(line));
      }
    }

    return MetroStatus(lines: lines, message: json['message']);
  }
}

class LineStatus {
  MetroLine line;

  /// The name of the stop
  String status;

  LineStatus({required this.line, required this.status});

  bool regular() {
    bool isOK = true;
    if (status != "Regolare") {
      isOK = false;
    }
    return isOK;
  }

  /// Parses a stop from a Map
  factory LineStatus.fromJson(Map<String, dynamic> json) {
    return LineStatus(
      line: MetroLine.parse(json['line'])!,
      status: json['status'],
    );
  }
}
