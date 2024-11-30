import 'package:algopath_app/domain/types/json_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'path_section.freezed.dart';
part 'path_section.g.dart';

@freezed
class PathSection with _$PathSection {
  const factory PathSection({
    required int id,
    required String name,
    required String slug,
    int? iconId,
    int? iconColor,
    @Default(true) bool isEnabled,
    @Default(true) bool isEditable,
    @Default([]) List<int> problemsIds,
    @Default('') String notes,
  }) = _PathSection;

  const PathSection._();

  factory PathSection.fromJson(JsonType json) => _$PathSectionFromJson(json);
}
