
import 'package:onboard_sdk/src/classes/stop/stop.class.dart';
import 'package:onboard_sdk/src/enums/stoptype/stoptype.enum.dart';

extension ListStopExt on List<Stop> {
  List<Stop> filterByStopType (List<StopType> type) {
    final stops = this.where((obj) {return type.contains(obj.type);});

    return stops.toList();
  }
}