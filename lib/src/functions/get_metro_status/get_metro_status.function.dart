import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onboard_sdk/src/classes/metrostatus/metrostatus.class.dart';
import 'package:onboard_sdk/src/constants/constants.dart';

Future<MetroStatus> getMetroStatus() async {
  try {
    final res = await http.get(Constants.metroStatusUrl);
    if (res.statusCode != 200) {
      throw http.ClientException(res.body);
    }
    final rawMetroStatus = jsonDecode(res.body);

    return MetroStatus.fromJson(rawMetroStatus);
    } on http.ClientException catch (e) {
    print(e.message);
    return Future.error(e.message);
  }
}

