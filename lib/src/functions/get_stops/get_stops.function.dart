import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onboard_sdk/src/classes/stop/stop.class.dart';
import 'package:onboard_sdk/src/constants/constants.dart';

Future<List<Stop>> getStops() async {
  try {
    final res = await http.get(Constants.stopsUrl);
    if (res.statusCode != 200) {
      throw http.ClientException(res.body);
    }

    final rawStops = jsonDecode(res.body);
    final List<Stop> stops = [];
    for (final stop in rawStops) {
      stops.add(Stop.fromJson(stop));
    }
    return stops;
    } on http.ClientException catch (e) {
    print(e.message);
    return Future.error(e.message);
  }
}
