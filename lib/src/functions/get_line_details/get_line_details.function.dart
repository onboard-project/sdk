import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onboard_client/src/classes/line/line.class.dart';
import 'package:onboard_client/src/constants/constants.dart';

Future<Line> getLineDetails(String lineId, {bool all = false}) async {
  try {
    final res = await http.get(Constants.lineDetailsUri(lineId, all: all));
    if (res.statusCode != 200) {
      throw http.ClientException(res.body);
    }

    final line = Line.fromJson(jsonDecode(res.body));
    return line;
    } on http.ClientException catch (e) {
    print(e.message);
    return Future.error(e.message);
  }
}
