class SurfaceStatus {
  /// The title of the status message
  String title;

  /// The body of the status message
  String content;

  SurfaceStatus({required this.title, required this.content});

  /// Parses a stop from a Map
  factory SurfaceStatus.fromJson(Map<String, dynamic> json) {

      return SurfaceStatus(title: json['title'], content: json['content']);
  }
}
