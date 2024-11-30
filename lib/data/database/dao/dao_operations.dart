import 'package:algopath_app/domain/types/json_type.dart';

abstract interface class DaoOperations {
  Future<JsonType?> read({
    required String id,
  });

  Future<List<JsonType>> readByIds({
    required List<String> ids,
    String idKey = 'id',
  });

  Future<List<JsonType>> readAll({
    String? orderByKey,
    bool orderByAsc = true,
  });

  Stream<JsonType?> watch({
    required String id,
  });

  Stream<List<JsonType>> watchByIds({
    required List<String> ids,
    String idKey = 'id',
  });

  Stream<List<JsonType>> watchAll({
    String? orderByKey,
    bool orderByAsc = true,
  });

  Future<void> upsert({
    required String id,
    required JsonType data,
  });

  Future<void> bulkUpsert({
    required List<JsonType> items,
    String idKey = 'id',
  });

  Future<void> remove({required String id});

  Future<void> clear();
}
