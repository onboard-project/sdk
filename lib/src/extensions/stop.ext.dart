import 'package:onboard_sdk/onboard_sdk.dart';
import 'package:onboard_sdk/src/classes/stop/stop.class.dart';
import 'package:onboard_sdk/src/enums/accessibilitytype/accessibilitytype.enum.dart';

extension StopExt on Stop {
  Stop filterWaitingTimes(String lineID) {
    lines = lines.where((i) {
      return i.id == lineID;
    }).toList();

    return this;
  }

  Future<AccessibilityType?> getAccessibility() async {
    accessibility = await OnboardSDK.getStopAccessibility(id);
    return accessibility;
  }
}
