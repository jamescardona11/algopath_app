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

import 'problem_data.dart';

class ProblemPathProvider extends ChangeNotifier {
  final String _slug;
  final DBService _db = DBService();

  ProblemPathProvider(this._slug) {
    _initSubscription();
  }

  StreamSubscription? _problemsStream;
  List<ListElementData> _listElementData = [];
  List<Problem> _problems = [];
  ProblemPath? _problemPath;
  SortProblemsBy _sortProblemsBy = SortProblemsBy.none;
  GroupProblemsBy _groupProblemsBy = GroupProblemsBy.none;

  List<ListElementData> get listElementData => _listElementData;

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
      _problems = problems;
      _addListElementData();

      notifyListeners();
    });
  }

  void _addListElementData() {
    _listElementData = _groupProblemsBy.when(
      {
        GroupProblemsBy.none: () => _groupByNone(),
        GroupProblemsBy.byDifficulty: () => _groupByDifficulty(),
        GroupProblemsBy.byTopic: () => _groupByTopic(),
        GroupProblemsBy.bySection: () => _groupBySection(),
      },
    );
  }

  List<ListElementData> _groupByNone() {
    return _sortElements(_problems.map((p) => ProblemData(p)).toList());
  }

  List<ListElementData> _groupByDifficulty() {
    final List<ListElementData> result = [];

    _problems.groupListsBy((p) => p.difficulty).forEach((key, value) {
      result.add(SectionData<String>(section: key.capitalize()));
      final elements = _sortElements(value.map((p) => ProblemData(p)).toList());
      result.addAll(elements);
    });

    return result;
  }

  List<ListElementData> _groupByTopic() {
    final List<ListElementData> result = [];

    _problems.groupListsBy((p) => p.topicTags.firstOrNull ?? 'No topic').forEach((key, value) {
      result.add(SectionData<String>(section: key.capitalize()));
      final elements = _sortElements(value.map((p) => ProblemData(p)).toList());
      result.addAll(elements);
    });

    return result;
  }

  List<ListElementData> _groupBySection() {
    if (_problemPath!.sections.isEmpty) return _groupByNone();
    final List<ListElementData> result = [];

    for (var section in _problemPath!.sections) {
      result.add(SectionData<String>(section: section.name.capitalize()));
      final elements = _sortElements(_problems.where((p) => section.problemsIds.contains(p.id)).map((p) => ProblemData(p)).toList());
      result.addAll(elements);
    }

    return result;
  }

  List<ProblemData> _sortElements(List<ProblemData> elements) {
    return _sortProblemsBy.when(
      {
        SortProblemsBy.byDifficulty: () => elements.sorted((a, b) => a.problem.difficultyValue.compareTo(b.problem.difficultyValue)),
        SortProblemsBy.byName: () => elements.sorted((a, b) => a.problem.title.compareTo(b.problem.title)),
      },
      orElse: () => elements,
    );
  }

  @override
  void dispose() {
    _problemsStream?.cancel();
    super.dispose();
  }
}
