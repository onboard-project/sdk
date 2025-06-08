import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onboard_client/src/classes/line/line.class.dart';
import 'package:onboard_client/src/constants/constants.dart';

Future<List<Line>> getLines() async {
  try {
    final res = await http.get(Constants.linesUrl);
    if (res.statusCode != 200) {
      throw http.ClientException(res.body);
    }

    final rawLines = jsonDecode(res.body);
    final List<Line> lines = [];
    for (final line in rawLines) {
      lines.add(Line.fromJson(line));
    }
    return lines;
    } on http.ClientException catch (e) {
    print(e.message);
    return Future.error(e.message);
  }
}
