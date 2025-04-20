class Exercise {
  final String name;
  final String bodyPart;
  final String equipment;
  final String gifUrl;
  final List<String> instructions;
  final String target;
  final List<String> secondaryMuscles;

  Exercise({
    required this.gifUrl,
    required this.name,
    required this.equipment,
    required this.bodyPart,
    required this.instructions,
    required this.target,
    required this.secondaryMuscles,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      bodyPart: json['bodyPart'],
      equipment: json['equipment'],
      gifUrl: json['gifUrl'],
      instructions: List<String>.from(json['instructions']),
      target: json['target'] ?? '',
      secondaryMuscles: List<String>.from(json['secondaryMuscles'] ?? []),
    );
  }
}
