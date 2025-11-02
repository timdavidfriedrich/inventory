class RemoteScanResult {
  final String name;
  final List<String> suggestedCategories;
  final double confidence;

  const RemoteScanResult({
    required this.name,
    this.suggestedCategories = const [],
    this.confidence = -1,
  });
}
