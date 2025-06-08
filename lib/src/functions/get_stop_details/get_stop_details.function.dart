import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onboard_client/src/classes/stop/stop.class.dart';
import 'package:onboard_client/src/constants/constants.dart';

Future<Stop> getStopDetails(String stopId) async {
  try {

    final res = await http.get(Constants.stopDetailsUri(stopId));
    if (res.statusCode != 200) {
      throw http.ClientException(res.body);
    }

    final stop = Stop.fromJson(jsonDecode(res.body));
    return stop;

  } on http.ClientException catch (e) {
    print(e.message);
    return Future.error(e.message);
  }
}
