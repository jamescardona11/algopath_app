import 'dart:async';

import 'package:algopath_app/core/extensions/enum_extensions.dart';
import 'package:algopath_app/data/database/collection_name.dart';
import 'package:algopath_app/data/database/db_service.dart';
import 'package:algopath_app/data/mapper_helpers/problem_mapper.dart';
import 'package:algopath_app/domain/problem/problem.dart';
import 'package:algopath_app/domain/problem_path/problem_path.dart';
import 'package:algopath_app/presentation/pages/home_page/problem_path/provider/filters.dart';
import 'package:algopath_app/utils/strings_extension.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'section_data.dart';

class ProblemPathProvider extends ChangeNotifier {
  final String _slug;
  final DBService _db = DBService();

  ProblemPathProvider(this._slug) {
    _initSubscription();
  }

  StreamSubscription? _problemsStream;
  ProblemPath? _problemPath;
  List<Problem> _allPathProblems = [];

  Map<SectionData, List<Problem>> _groupedProblems = {};
  SortProblemsBy _sortProblemsBy = SortProblemsBy.none;
  GroupProblemsBy _groupProblemsBy = GroupProblemsBy.none;

  Map<SectionData, List<Problem>> get groupedProblems => _groupedProblems;
  List<SectionData> get sections => _groupedProblems.keys.toList();

  bool get isEmptySections => sections.isEmpty || sections.first.title == noGroup;

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
      _allPathProblems = problems;
      _addListElementData();

      notifyListeners();
    });
  }

  void _addListElementData() {
    _groupedProblems = _groupProblemsBy.when(
      {
        GroupProblemsBy.none: () => _groupByNone(),
        GroupProblemsBy.byDifficulty: () => _groupByDifficulty(),
        GroupProblemsBy.byTopic: () => _groupByTopic(),
        GroupProblemsBy.bySection: () => _groupBySection(),
      },
    );
  }

  Map<SectionData, List<Problem>> _groupByNone() {
    final problems = _sortElements(_allPathProblems);

    return {SectionData(title: noGroup): problems};
  }

  Map<SectionData, List<Problem>> _groupByDifficulty() {
    return _allPathProblems.groupListsBy((p) => p.difficulty).map((key, value) {
      final section = SectionData(title: key.capitalize());
      final problems = _sortElements(value);

      return MapEntry(section, problems);
    });
  }

  Map<SectionData, List<Problem>> _groupByTopic() {
    return _allPathProblems.groupListsBy((p) => p.topicTags.firstOrNull ?? 'No topic').map((key, value) {
      final section = SectionData(title: key.capitalize());
      final problems = _sortElements(value);
      return MapEntry(section, problems);
    });
  }

  Map<SectionData, List<Problem>> _groupBySection() {
    if (_problemPath!.sections.isEmpty) return _groupByNone();

    return Map.fromEntries(
      _problemPath!.sections.map((pathSection) {
        final section = SectionData(title: pathSection.name.capitalize());
        final problemsBySection = _allPathProblems.where((p) => pathSection.problemsIds.contains(p.id)).toList();
        final problems = _sortElements(problemsBySection);

        return MapEntry(section, problems);
      }),
    );
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
