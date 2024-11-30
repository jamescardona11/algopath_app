import 'dart:async';

import 'package:algopath_app/data/database/collection_name.dart';
import 'package:algopath_app/data/database/db_service.dart';
import 'package:algopath_app/domain/problem_path/problem_path.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  final DBService _db = DBService();

  HomePageProvider([String? slug]) {
    _selectedSlug = slug;
    _initSubscription();
  }

  List<ProblemPath> _paths = [];
  String? _selectedSlug;
  StreamSubscription? pathsStream;

  List<ProblemPath> get paths => _paths;
  int? get selectedIndex {
    final index = _paths.indexWhere((r) => r.slug == _selectedSlug);
    return index == -1 ? null : index;
  }

  void setSelectedPath(String slug) {
    _selectedSlug = slug;
    notifyListeners();
  }

  Future<void> togglePathEnabled(int pathId) async {
    final path = _paths.firstWhere((r) => r.id == pathId);
    final updatedPath = path.copyWith(isEnabled: !path.isEnabled);
    await _updatePath(updatedPath);
  }

  Future<void> addProblemToPath(int pathId, int problemId) async {
    final path = _paths.firstWhere((r) => r.id == pathId);
    if (!path.problemsIds.contains(problemId)) {
      final updatedPath = path.copyWith(
        problemsIds: [...path.problemsIds, problemId],
      );
      await _updatePath(updatedPath);
    }
  }

  Future<void> removeProblemFromPath(int pathId, int problemId) async {
    final path = _paths.firstWhere((r) => r.id == pathId);
    if (path.problemsIds.contains(problemId)) {
      final updatedPath = path.copyWith(
        problemsIds: path.problemsIds.where((id) => id != problemId).toList(),
      );
      await _updatePath(updatedPath);
    }
  }

  void _initSubscription() {
    pathsStream = _db
        .run(CollectionName.problemPaths)
        .watchAll()
        .map((jsonList) => jsonList.map((json) => ProblemPath.fromJson(json)).toList())
        .map((paths) => paths.sorted((a, b) => a.order.compareTo(b.order)))
        .listen((paths) {
      _paths = paths;
      _updateSelectedPath();
      notifyListeners();
    });
  }

  Future<void> _updatePath(ProblemPath updatedPath) async {
    await _db.run(CollectionName.problemPaths).upsert(
          id: updatedPath.dbId,
          data: updatedPath.toJson(),
        );
  }

  void _updateSelectedPath() {
    if (_selectedSlug == null && paths.isNotEmpty) {
      _selectedSlug = paths.first.slug;
    } else if (_selectedSlug != null) {
      _selectedSlug = paths.firstWhere((r) => r.slug == _selectedSlug).slug;
    }
  }

  @override
  void dispose() {
    pathsStream?.cancel();
    super.dispose();
  }
}