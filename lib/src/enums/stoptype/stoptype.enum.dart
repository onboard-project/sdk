enum StopType {

  /// Any surface stop (trams, buses or trolleybuses)
  surface,

  /// Any underground metro stop
  metro,


  /// The two stops of the light metro between Cascina Gobba M2 and the San Raffaele Hospital
  mela;

  /// Parses the stoptype from a string
  static StopType? parse(String type) {
    switch (type.toLowerCase()) {
      case 'surface':
        return StopType.surface;
      case 'metro':
        return StopType.metro;
      case 'mela':
        return StopType.mela;
      default:
        return null;
    }
  }
}
