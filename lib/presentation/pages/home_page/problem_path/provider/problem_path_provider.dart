import 'dart:async';

import 'package:algopath_app/core/extensions/enum_extensions.dart';
import 'package:algopath_app/data/database/collection_name.dart';
import 'package:algopath_app/data/database/db_service.dart';
import 'package:algopath_app/data/mapper_helpers/problem_mapper.dart';
import 'package:algopath_app/data/mapper_helpers/topic_tag_mapper.dart';
import 'package:algopath_app/domain/problem/problem.dart';
import 'package:algopath_app/domain/problem/topic_tag/topic_tag.dart';
import 'package:algopath_app/domain/problem_path/problem_path.dart';
import 'package:algopath_app/presentation/pages/home_page/problem_path/provider/filters.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'section_data.dart';

class ProblemPathProvider extends ChangeNotifier {
  final String _slug;
  final DBService _db = DBService();

  ProblemPathProvider(this._slug) {
    _initSubscription();
    _readTopicTags();
  }

  StreamSubscription? _problemsStream;
  ProblemPath? _problemPath;
  final List<Problem> _allPathProblems = [];
  final Map<String, TopicTag> _topicTags = {};

  final List<SectionData> _groupedProblems = [];
  SortProblemsBy _sortProblemsBy = SortProblemsBy.none;
  GroupProblemsBy _groupProblemsBy = GroupProblemsBy.none;

  List<SectionData> get groupedProblems => _groupedProblems;
  List<Problem> get allPathProblems => _allPathProblems;
  Map<String, TopicTag> get topicTags => _topicTags;
  bool get hasSections => groupedProblems.isNotEmpty && !groupedProblems.first.isNoGroup;

  void changeGroupProblemsBy(GroupProblemsBy groupProblemsBy) {
    _groupProblemsBy = groupProblemsBy;
    notifyListeners();
  }

  void changeSortProblemsBy(SortProblemsBy sortProblemsBy) {
    _sortProblemsBy = sortProblemsBy;
    notifyListeners();
  }

  Future<void> _initSubscription() async {
    _problemPath = await _db.run(CollectionName.problemPaths).read(id: _slug).then((json) {
      if (json == null) return null;
      return ProblemPath.fromJson(json);
    });

    if (_problemPath == null) {
      // Handle error
      return;
    }

    final problemIds = (_problemPath!.problemsIds.isNotEmpty
        ? _problemPath!.problemsIds
        : _problemPath!.sections.expand((section) => section.problemsIds));

    _problemsStream = _db
        .run(CollectionName.problems)
        .watchByIds(ids: problemIds.map((e) => e.toString()).toList())
        .map((jsonList) => ProblemMapper.fromJsonList(jsonList))
        .listen((problems) {
      _allPathProblems.clear();
      _allPathProblems.addAll(problems);

      _addListElementData();

      notifyListeners();
    });
  }

  Future<void> _readTopicTags() async {
    final topicTags = await _db.run(CollectionName.tags).readAll().then((jsonList) => TopicTagMapper.toMapTopicTags(jsonList));
    _topicTags.addAll(topicTags);
  }

  void _addListElementData() {
    _groupedProblems.clear();

    _groupedProblems.addAll(
      _groupProblemsBy.when(
        {
          GroupProblemsBy.none: () => _groupByNone(),
          GroupProblemsBy.byDifficulty: () => _groupByDifficulty(),
          GroupProblemsBy.byTopic: () => _groupByTopic(),
          GroupProblemsBy.bySection: () => _groupBySection(),
        },
      ),
    );
  }

  List<SectionData> _groupByNone() {
    final problems = _sortElements(_allPathProblems);
    return [SectionData(problems: problems)];
  }

  List<SectionData> _groupByDifficulty() {
    return _allPathProblems
        .groupListsBy((p) => p.difficulty)
        .map((key, value) {
          final problems = _sortElements(value);
          return MapEntry(key, SectionData(title: key, problems: problems));
        })
        .values
        .toList();
  }

  List<SectionData> _groupByTopic() {
    return _allPathProblems
        .groupListsBy((p) => p.topicTags.firstOrNull ?? 'No topic')
        .map((key, value) {
          final problems = _sortElements(value);
          return MapEntry(key, SectionData(title: key, problems: problems));
        })
        .values
        .toList();
  }

  List<SectionData> _groupBySection() {
    if (_problemPath!.sections.isEmpty) return _groupByNone();

    return _problemPath!.sections.map((pathSection) {
      final problemsBySection = _allPathProblems.where((p) => pathSection.problemsIds.contains(p.id)).toList();
      final problems = _sortElements(problemsBySection);

      return SectionData(title: pathSection.name, problems: problems);
    }).toList();
  }

  List<Problem> _sortElements(List<Problem> elements) {
    return _sortProblemsBy.when(
      {
        SortProblemsBy.byDifficulty: () => elements.sorted((a, b) => a.difficultyValue.compareTo(b.difficultyValue)),
        SortProblemsBy.byName: () => elements.sorted((a, b) => a.title.compareTo(b.title)),
      },
      orElse: () => elements,
    );
  }

  @override
  void dispose() {
    _problemsStream?.cancel();
    super.dispose();
  }

  static const String noGroup = 'NO GROUP';
}
