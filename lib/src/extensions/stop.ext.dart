import 'package:onboard_client/src/classes/stop/stop.class.dart';

extension StopExt on Stop {
  Stop filterWaitingTimes (String lineID) {
    lines = lines.where((i) {return i.id == lineID;}).toList();

    return this;
  }
}