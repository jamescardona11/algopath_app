import 'dart:convert';

import 'package:algopath_app/domain/types/json_type.dart';
import 'package:algopath_app/utils/logger/logger.dart';
import 'package:flutter/services.dart';

class LoadJsonData {
  final String _assetProblemsPath = 'assets/def_problems.json';
  final String _assetPathsPath = 'assets/def_paths.json';

  // This file will be used to track the version of the data, until we have a real backend
  // If the version is not the same as previous, we will reload the data
  final String _assetVersionPath = 'assets/version.json';

  Future<List<JsonType>> loadPaths() async {
    try {
      // Load the JSON file from assets
      final String jsonString = await rootBundle.loadString(_assetPathsPath);

      // Parse the JSON string into a List of Maps
      final List<dynamic> jsonList = json.decode(jsonString);

      // Convert each item to Map<String, dynamic>
      return jsonList.map((item) => JsonType.from(item)).toList();
    } catch (e) {
      AppLogger().e('Error loading paths from JSON: $e');
      return [];
    }
  }

  //Map<String, dynamic> customTransform(Map<String, dynamic> item)

  Future<List<JsonType>> loadProblems() async {
    try {
      // Load the JSON file from assets
      final String jsonString = await rootBundle.loadString(_assetProblemsPath);

      // Parse the JSON string into a List of Maps
      final List<dynamic> jsonList = json.decode(jsonString);

      // Convert each item to Map<String, dynamic>
      return jsonList.map((item) => JsonType.from(item)).map((item) {
        item['paidOnly'] = item['paidOnly'] == 'TRUE';
        item['topicTags'] =
            (item['topicTags'] as String?)?.split(';').map((topic) => topic.trim().toLowerCase()).where((e) => e.isNotEmpty).toList();
        return item;
      }).toList();
    } catch (e) {
      AppLogger().e('Error loading problems from JSON: $e');
      return [];
    }
  }

  Future<JsonType> loadVersion() async {
    try {
      final String jsonString = await rootBundle.loadString(_assetVersionPath);
      // Parse the JSON string into a List of Maps
      final jsonMap = json.decode(jsonString);
      return jsonMap;
    } catch (e) {
      AppLogger().e('Error loading version from JSON: $e');
      return {};
    }
  }
}
