enum AccessibilityType {
  /// The stop and all the lines passing by are accessible
  always,

  /// The stop is accessible, lines passing by do not
  stopOnly,

  /// The stop and some lines passing by are accessible
  someLines,

  /// The stop is not accessible, all the lines passing by are accessible
  allLinesOnly,

  /// Neither the stop nor all the lines passing by are accessible
  never,

  /// The stop is not accessible, some lines passing by are accessible
  someLinesOnly;

  static AccessibilityType? parse(String? type) {
    switch (type?.toLowerCase()) {
      case 'always':
        return .always;
      case 'stop_only':
        return .stopOnly;
      case 'some_lines':
        return .someLines;
      case 'all_lines_only':
        return .allLinesOnly;
      case 'never':
        return .never;
      case 'some_lines_only':
        return .someLinesOnly;
      default:
        return null;
    }
  }
}
