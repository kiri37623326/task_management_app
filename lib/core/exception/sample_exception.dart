class SampleException implements Exception {
  SampleException({this.message});
  final String? message;

  @override
  String toString() {
    return "SampleException: ${message ?? "Unknown Exception."}";
  }
}
