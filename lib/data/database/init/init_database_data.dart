import 'dart:convert';

import 'package:algopath_app/domain/types/json_type.dart';
import 'package:algopath_app/utils/logger/logger.dart';
import 'package:flutter/services.dart';

class InitDatabaseData {
  Future<List<JsonType>> loadJson(String path) async {
    try {
      // Load the JSON file from assets
      final String jsonString = await rootBundle.loadString(path);

      // Parse the JSON string into a List of Maps
      final List<dynamic> jsonList = json.decode(jsonString);

      // Convert each item to Map<String, dynamic>
      return jsonList.map((item) => JsonType.from(item)).toList();
    } catch (e) {
      AppLogger().e('Error loading paths from JSON: $e');
      return [];
    }
  }
}
