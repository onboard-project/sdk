enum MetroLine {

  M1("M1", 0xFFE31D1A),
  M2("M2", 0xFF638B18),
  M3("M3", 0xFFF6A704),
  M4("M4", 0xFF1F3E6D),
  M5("M5", 0xFF9778D3);

  final String name ;
  final int color ;
  const MetroLine(this.name, this.color);

  /// Parses the stoptype from a string
  static MetroLine? parse(String line) {
    switch (line.toUpperCase()) {
      case 'M1':
        return MetroLine.M1;
      case 'M2':
        return MetroLine.M2;
      case 'M3':
        return MetroLine.M3;
        case 'M4':
        return MetroLine.M4;
        case 'M5':
        return MetroLine.M5;
      default:
        return null;
    }
  }
}
