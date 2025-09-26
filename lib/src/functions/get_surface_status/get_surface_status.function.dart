import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onboard_sdk/src/classes/status/surface/surface.status.class.dart';
import 'package:onboard_sdk/src/constants/constants.dart';

Future<SurfaceStatus> getSurfaceStatus() async {
  try {
    final res = await http.get(Constants.surfaceStatusUrl);
    if (res.statusCode != 200) {
      throw http.ClientException(res.body);
    }
    final rawSurfaceStatus = jsonDecode(res.body);

    return SurfaceStatus.fromJson(rawSurfaceStatus);
    } on http.ClientException catch (e) {
    print(e.message);
    return Future.error(e.message);
  }
}

