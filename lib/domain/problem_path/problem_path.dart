import 'package:algopath_app/domain/types/json_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'section/path_section.dart';

part 'problem_path.freezed.dart';
part 'problem_path.g.dart';

const int defaultIconColor = 0xFF9E9E9E;

@freezed
class ProblemPath with _$ProblemPath {
  const factory ProblemPath({
    required String slug,
    required String name,
    String? description,
    int? iconId,
    @Default(defaultIconColor) int iconColor,
    @Default(true) bool isEnabled,
    @Default(true) bool isEditable,
    @Default([]) List<int> problemsIds,
    @Default([]) List<PathSection> sections,
    @Default('') String notes,
    @Default(10) int order,
  }) = _ProblemPath;

  const ProblemPath._();

  factory ProblemPath.fromJson(JsonType json) => _$ProblemPathFromJson(json);

  String get dbId => slug;
}
