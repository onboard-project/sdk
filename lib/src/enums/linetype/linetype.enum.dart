enum LineType {

  /// Any surface line (trams, buses or trolleybuses)
  surface,

  /// Any underground metro line
  metro,

  /// The light metro between Cascina Gobba M2 and the San Raffaele Hospital
  mela;

  static LineType? parse(String type) {
    switch (type.toLowerCase()) {
      case 'surface':
        return LineType.surface;
      case 'metro':
        return LineType.metro;
      case 'mela':
        return LineType.mela;
      default:
        return null;
    }
  }
}
