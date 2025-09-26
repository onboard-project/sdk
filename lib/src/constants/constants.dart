class Constants {
  Constants._();

  static Uri stopsUrl = Uri.parse(
    "https://onboard-project-api.vercel.app/stops",
  );

  static Uri stopDetailsUri(String stopId) =>
      Uri.parse("https://onboard-project-api.vercel.app/stops/$stopId");
  static Uri linesUrl = Uri.parse(
    "https://onboard-project-api.vercel.app/lines",
  );

  static Uri lineDetailsUri(String lineId, {required bool all}) => Uri.parse(
    "https://onboard-project-api.vercel.app/lines/$lineId?all=$all",
  );

    static Uri metroStatusUrl = Uri.parse(
    "https://onboard-project-api.vercel.app/status/metro",
  );

  static Uri surfaceStatusUrl = Uri.parse(
    "https://onboard-project-api.vercel.app/status/surface",
  );
}
