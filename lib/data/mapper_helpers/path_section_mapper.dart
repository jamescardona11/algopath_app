import 'package:algopath_app/domain/problem_path/path_section.dart';
import 'package:algopath_app/domain/types/json_type.dart';

abstract class PathSectionMapper {
  static List<PathSection> fromJsonList(List<dynamic> jsonList) => jsonList.map((json) => PathSection.fromJson(json as JsonType)).toList();

  static Map<int, PathSection> toMapSections(List<PathSection>? sections) =>
      Map.fromEntries(sections?.map((section) => MapEntry(section.id, section)) ?? const {});
}
