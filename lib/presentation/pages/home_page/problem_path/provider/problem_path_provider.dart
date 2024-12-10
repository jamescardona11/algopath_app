import 'dart:async';

import 'package:algopath_app/data/database/collection_name.dart';
import 'package:algopath_app/data/database/db_service.dart';
import 'package:algopath_app/data/mapper_helpers/problem_mapper.dart';
import 'package:algopath_app/domain/problem/problem.dart';
import 'package:algopath_app/domain/problem_path/problem_path.dart';
import 'package:flutter/material.dart';

class ProblemPathProvider extends ChangeNotifier {
  final String _slug;
  final DBService _db = DBService();

  ProblemPathProvider(this._slug) {
    _initSubscription();
  }

  StreamSubscription? _problemsStream;
  List<Problem> _problems = [];
  ProblemPath? _problemPath;

  List<Problem> get problems => _problems;

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

      notifyListeners();
    });
  }

  @override
  void dispose() {
    _problemsStream?.cancel();
    super.dispose();
  }
}