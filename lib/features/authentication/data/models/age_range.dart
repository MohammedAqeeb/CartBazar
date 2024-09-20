class AgeRange {
  final String range;

  AgeRange({
    required this.range,
  });

  factory AgeRange.fromMap(Map<String, dynamic> map) {
    return AgeRange(
      range: (map['range'] ?? '') as String,
    );
  }
}
