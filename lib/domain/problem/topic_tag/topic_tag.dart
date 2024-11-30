import 'package:algopath_app/domain/types/json_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_tag.freezed.dart';
part 'topic_tag.g.dart';

@freezed
class TopicTag with _$TopicTag {
  const factory TopicTag({
    required String id,
    required int color,
  }) = _TopicTag;

  const TopicTag._();

  factory TopicTag.fromJson(JsonType json) => _$TopicTagFromJson(json);

  String get name => id;
}
