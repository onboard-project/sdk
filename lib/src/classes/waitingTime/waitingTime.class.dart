import 'package:onboard_client/src/enums/waitingtimetype/waitingtimetype.enum.dart';

class WaitingTime {

  /// The type of waitingTime
  final WaitingTimeType type;

  /// The value of the waitingTime, required only for [WaitingTimeType.time]
  final int? value;

  const WaitingTime({
    required this.type,
    this.value,
  });


  factory WaitingTime.fromJson(Map<String, dynamic> json) {
    return WaitingTime(
      type: WaitingTimeType.parse(json['type']),
      value: int.tryParse(json['value'] ?? ""),
    );
  }

  const WaitingTime.none() : this(type: WaitingTimeType.none);
}
