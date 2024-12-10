import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem.freezed.dart';
part 'problem.g.dart';

@freezed
class Problem with _$Problem {
  const factory Problem({
    required int id,
    required String title,
    required String titleSlug,
    required String difficulty,
    required double acRate,
    @Default(0) int likes,
    @Default(0) int dislikes,
    @Default([]) List<String> topicTags,
    @Default('') String notes,
    @Default('') String explanation,
    @Default(false) bool paidOnly,
    DateTime? solvedDate,
    int? solvedTime,
    int? solvedCount,
    @Default(false) bool repeatLater,
    @Default(false) bool isFavorite,
  }) = _DsaProblemModel;

  const Problem._();

  factory Problem.fromJson(Map<String, dynamic> json) => _$ProblemFromJson(json);

  String get dbId => id.toString();

  bool get wasSolved => solvedDate != null;

  bool get isEasy => difficulty == 'Easy';
  bool get isMedium => difficulty == 'Medium';
  bool get isHard => difficulty == 'Hard';

  int get difficultyValue {
    switch (difficulty) {
      case 'Easy':
        return 2;
      case 'Medium':
        return 1;
    }
    return 0;
  }
}
