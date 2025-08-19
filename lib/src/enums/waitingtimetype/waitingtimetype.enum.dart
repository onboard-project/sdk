/// The type of waiting time
enum WaitingTimeType {
  /// The waiting time is not available here
  none,

  /// A vehicle has just left this stop
  reloading,

  /// The vehicle will arrive in more than 30 minutes
  plus30,

  /// The vehicle will arrive in 2 <= time <= 30 minutes, the value is specified by WaitingTime.value and at '["waitingTime"]["value]',
  time,

  /// This route is operated only during the night
  nightly,

  /// The vehicle is approaching this stop
  arriving,

  /// The vehicle has been stationary for at least 90 seconds at a stop due to traffic or a passenger's medical needs
  waiting,

  /// The route in service but not stopping here at the moment (i.e.: deviations...)
  /// The stop is in service, other routes might stop here
  noService,

  /// This stop is temporarily out of order (i.e.: road works...)
  suspended;


  /// Parses the waitingtimetype from a string
  static WaitingTimeType parse(String type) {
    switch (type.toLowerCase()) {
      case 'reloading':
        return WaitingTimeType.reloading;
      case 'plus30':
        return WaitingTimeType.plus30;
      case 'time':
        return WaitingTimeType.time;
      case "nightly":
        return WaitingTimeType.nightly;
      case "arriving":
        return WaitingTimeType.arriving;
      case "waiting":
        return WaitingTimeType.waiting;
      case "noservice":
        return WaitingTimeType.noService;
      case "suspended":
        return WaitingTimeType.suspended;
      default:
        return WaitingTimeType.none;
    }
  }
}
