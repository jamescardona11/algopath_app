import 'package:algopath_app/domain/problem/topic_tag/topic_tag.dart';
import 'package:algopath_app/domain/types/json_type.dart';

abstract class TopicTagMapper {
  static const idKey = 'id';

  static List<TopicTag> fromJsonList(List<JsonType> jsonList) => jsonList
      .map(
        (json) => TopicTag.fromJson(json),
      )
      .toList();

  static Map<String, TopicTag> toMapTopicTags(List<JsonType> jsonList) => Map.fromEntries(
        jsonList.map(
          (json) => MapEntry(
            json[idKey] as String,
            TopicTag.fromJson(json),
          ),
        ),
      );
}
