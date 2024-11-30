import 'package:algopath_app/data/database/collection_name.dart';
import 'package:algopath_app/data/database/db_service.dart';
import 'package:algopath_app/data/mapper_helpers/path_section_mapper.dart';
import 'package:algopath_app/data/mapper_helpers/problem_path_mapper.dart';
import 'package:algopath_app/data/preferences/local_shared_preferences.dart';
import 'package:algopath_app/domain/problem_path/path_section.dart';
import 'package:algopath_app/domain/problem_path/problem_path.dart';
import 'package:algopath_app/domain/types/json_type.dart';
import 'package:algopath_app/utils/app_icons_info_provider.dart';

import 'load_json_data.dart';

class InitDatabaseData {
  InitDatabaseData();

  final _loadJson = LoadJsonData();
  final _db = DBService();
  final _appPreferences = AppPreferences();
  final _iconsProvider = AppIconsInfoProvider();

  final _problemsVersionKey = 'db_problems_version_key';
  final _pathsVersionKey = 'db_paths_version_key';

  Future<void> init() async {
    // Initialize the database
    final versionMap = await _loadJson.loadVersion();

    // First time this will be null and the json version will be 1
    final dbProblemsVersion = await _appPreferences.readInt(_problemsVersionKey) ?? 0;
    final dbPathsVersion = await _appPreferences.readInt(_pathsVersionKey) ?? 0;

    final problemsVersion = versionMap[_problemsVersionKey] ?? 1;
    final pathsVersion = versionMap[_pathsVersionKey] ?? 1;

    await _upsertProblemsPaths(dbPathsVersion != pathsVersion);

    await _appPreferences.save(_problemsVersionKey, problemsVersion);
    await _appPreferences.save(_pathsVersionKey, pathsVersion);
  }

  Future<void> _upsertProblemsPaths(bool needToUpsert) async {
    if (!needToUpsert) return;

    final dbPaths = await _db
        .run(CollectionName.problemPaths) //
        .readAll()
        .then((paths) => ProblemPathMapper.toMapProblemPaths(paths));

    final pathsJsonList = await _loadJson.loadPaths().then((jsonList) => jsonList
        .map((itemJson) => ProblemPath.fromJson(itemJson))
        .map((newItem) {
          final dbPath = dbPaths[newItem.id];
          final itemSections = _getPathSections(newItem.toJson(), dbPath);
          final problemsIds = <int>{...dbPath?.problemsIds ?? [], ...newItem.problemsIds}.toList();

          return newItem.copyWith(
            iconId: dbPath?.iconId ?? _iconsProvider.randomIconId,
            iconColor: dbPath?.iconColor ?? defaultIconColor,
            isEnabled: dbPath?.isEnabled ?? true,
            isEditable: dbPath?.isEditable ?? true,
            sections: itemSections,
            notes: dbPath?.notes ?? '',
            problemsIds: problemsIds,
          );
        })
        .map((item) => item.toJson())
        .toList());

    await _db.run(CollectionName.problemPaths).bulkUpsert(items: pathsJsonList);
  }

  static List<PathSection> _getPathSections(
    JsonType problemPathJson,
    ProblemPath? dbPaths,
  ) {
    final dbSectionsMap = PathSectionMapper.toMapSections(dbPaths?.sections);
    final jsonSections = PathSectionMapper.fromJsonList((problemPathJson[ProblemPathMapper.sectionsKey] ?? []) as List<dynamic>);

    final itemSections = jsonSections.map((newSection) {
      final dbSection = dbSectionsMap[newSection.id];
      final problemsIds = <int>{...dbSection?.problemsIds ?? [], ...newSection.problemsIds}.toList();

      return newSection.copyWith(
        iconId: dbSection?.iconId,
        iconColor: dbSection?.iconColor,
        isEnabled: dbSection?.isEnabled ?? newSection.isEnabled,
        isEditable: dbSection?.isEditable ?? newSection.isEditable,
        problemsIds: problemsIds,
        notes: dbSection?.notes ?? '',
      );
    }).toList();

    return itemSections;
  }
}
