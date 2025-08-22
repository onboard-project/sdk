import 'package:onboard_sdk/onboard_sdk.dart'; // Or the correct path to your sdk

void main() async {
      print("---\nGetting Metro Status");
  try {
    final generalStatus = await OnboardSDK.getMetroStatus();
    print(generalStatus.regular().toString());
    for (final line in generalStatus.lines) {
      print("${line.line}: ${line.status}");

    }
    print(generalStatus.message);

  } catch (e, s) {
    print("Error getting line details: $e");
    print("Stack trace:\n$s");
  }

  print("---\nGetting Stops");
  try {
    // Correct way to call the static method
    final stops = await OnboardSDK.getStops();
    for (final stop in stops) {
      print("${stop.id} - ${stop.name}");
    }
  } catch (e, s) {
    // Catching stack trace is helpful
    print("Error getting stops: $e");
    print("Stack trace:\n$s");
  }

  print("---\nGetting Lines");
  try {
    // Correct way to call the static method
    final lines = await OnboardSDK.getLines();
    for (final line in lines) {
      print(
        "${line.headcode} (dir ${line.direction}) - ${line.start} -> ${line.terminus}",
      );
    }
  } catch (e, s) {
    print("Error getting lines: $e");
    print("Stack trace:\n$s");
  }

  // ... and so on for getStopDetails and getLineDetails
  print("---\nGetting Stop Details for 11269");
  try {
    final stop = await OnboardSDK.getStopDetails("11269");
    print("${stop.id} - ${stop.name}");
    for (final line in stop.lines) {
      print(
        line.headcode +
            " - " +
            line.start +
            " -> " +
            line.terminus +
            ": " +
            (line.waitingTime.type == WaitingTimeType.time
                ? line.waitingTime.value.toString()
                : line.waitingTime.type.toString()),
      );
    }
  } catch (e, s) {
    print("Error getting stop details: $e");
    print("Stack trace:\n$s");
  }

  print("---\nGetting Line Details for 1|1");
  try {
    final line = await OnboardSDK.getLineDetails(
      "1|1",
    ); // 'all' defaults to false
    print(
      "${line.headcode} (dir ${line.direction}) - ${line.start} -> ${line.terminus}",
    );
  } catch (e, s) {
    print("Error getting line details: $e");
    print("Stack trace:\n$s");
  }

  print("---\nGetting Stop Waiting Times for 1|0");
  try {
    final line = await OnboardSDK.getLineDetails("1|0"); // 'all' defaults to false
    for (final stop in line.stops) {
      if (stop != null) {
        final time_raw = await OnboardSDK.getStopDetails(stop.id);
        final times = time_raw.filterWaitingTimes("1|0");
        final l = times.lines[0];
        print((l.waitingTime.type == WaitingTimeType.time ? l.waitingTime.value.toString()  + " minutes" : l.waitingTime.type.toString()) + " at " + times.name);
      }
    }
  } catch (e, s) {
    print("Error getting line details: $e");
    print("Stack trace:\n$s");}


}