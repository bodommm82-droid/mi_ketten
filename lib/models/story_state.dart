class StoryState {
  final int chapter;
  final String mood;
  final Map<String, dynamic> variables;

  StoryState({
    required this.chapter,
    required this.mood,
    required this.variables,
  });

  StoryState copyWith({
    int? chapter,
    String? mood,
    Map<String, dynamic>? variables,
  }) {
    return StoryState(
      chapter: chapter ?? this.chapter,
      mood: mood ?? this.mood,
      variables: variables ?? this.variables,
    );
  }

  Map<String, dynamic> toJson() => {
        'chapter': chapter,
        'mood': mood,
        'variables': variables,
      };

  factory StoryState.fromJson(Map<String, dynamic> json) => StoryState(
        chapter: json['chapter'],
        mood: json['mood'],
        variables: Map<String, dynamic>.from(json['variables']),
      );
}
