import 'package:algopath_app/domain/problem_path/problem_path.dart';
import 'package:algopath_app/domain/types/json_type.dart';

abstract class ProblemPathMapper {
  static const idKey = 'id';
  static const problemsIdsKey = 'problemsIds';
  static const sectionsKey = 'sections';
  static const isEditableKey = 'isEditable';
  static const isEnabledKey = 'isEnabled';

  static List<ProblemPath> fromJsonList(List<JsonType> jsonList) => jsonList.map((json) => ProblemPath.fromJson(json)).toList();

  static Map<int, ProblemPath> toMapProblemPaths(List<JsonType> jsonList) => Map.fromEntries(
        jsonList.map(
          (json) => MapEntry(
            json[idKey] as int,
            ProblemPath.fromJson(json),
          ),
        ),
      );
}
