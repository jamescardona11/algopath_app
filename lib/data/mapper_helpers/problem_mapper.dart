import 'package:algopath_app/domain/problem/problem.dart';
import 'package:algopath_app/domain/types/json_type.dart';

abstract class ProblemMapper {
  static const idKey = 'id';
  static const topicTagsKey = 'topicTags';

  static List<Problem> fromJsonList(List<JsonType> jsonList) => jsonList
      .map(
        (json) => Problem.fromJson(json),
      )
      .toList();

  static Map<int, Problem> toMapProblems(List<JsonType> jsonList) => Map.fromEntries(
        jsonList.map(
          (json) => MapEntry(
            json[idKey] as int,
            Problem.fromJson(json),
          ),
        ),
      );
}
