class ScanResult {
  final String name;
  final List<String> suggestedCategories;
  final double confidence;

  const ScanResult({
    required this.name,
    this.suggestedCategories = const [],
    this.confidence = -1,
  });
}
