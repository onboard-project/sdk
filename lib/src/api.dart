import 'package:onboard_client/src/classes/line/line.class.dart';
import 'package:onboard_client/src/classes/stop/stop.class.dart';
import 'functions/get_line_details/get_line_details.function.dart' as a;
import 'functions/get_lines/get_lines.function.dart' as b;
import 'functions/get_stop_details/get_stop_details.function.dart' as c;
import 'functions/get_stops/get_stops.function.dart' as d;


class OnboardClient {

  /// Get the details for the [lineId]
  /// Use [all = true] to dump all the stops of a line, alphabetically ordered, no matter the Branch.
  /// Use [all = false] to dump the stops of the main branch only.
  static Future<Line> getLineDetails(String lineId, {bool all = false}) async {
    return a.getLineDetails(lineId, all: all);
  }

  /// Get all the lines
  static Future<List<Line>> getLines() async {
    return b.getLines();
  }

  /// Get the details for the [stopId]
  static Future<Stop> getStopDetails(String stopId) async {
    return c.getStopDetails(stopId);
  }

  /// Get all the stops
  static Future<List<Stop>> getStops() async {
    return d.getStops();
  }
}
