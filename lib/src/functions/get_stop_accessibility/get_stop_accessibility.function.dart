import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onboard_sdk/src/constants/constants.dart';
import 'package:onboard_sdk/src/enums/accessibilitytype/accessibilitytype.enum.dart';

Future<AccessibilityType?> getStopAccessibility(String stopId) async {
  try {

    final res = await http.get(Constants.stopAccessibilityUri(stopId));
    if (res.statusCode != 200) {
      throw http.ClientException(res.body);
    }

    final accessibility = AccessibilityType.parse(jsonDecode(res.body)['accessibility']);
    return accessibility;

  } on http.ClientException catch (e) {
    print(e.message);
    return Future.error(e.message);
  }
}
