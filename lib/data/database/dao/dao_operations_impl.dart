import 'package:algopath_app/domain/types/json_type.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sembast/sembast.dart';

import 'dao_operations.dart';

class DaoOperationImpl implements DaoOperations {
  final String collectionName;
  final Future<Database?> db;

  DaoOperationImpl(this.collectionName, this.db);

  // Table/collection references
  // For custom operations use this _dbCollection, maybe convert to public
  // Or Create a new DaoOperationImpl
  StoreRef<String, JsonType> _dbCollection(String tableName) => StoreRef<String, JsonType>(tableName);

  @override
  Future<JsonType?> read({
    required String id,
  }) async {
    final database = await db;
    if (database == null) return null;

    return _dbCollection(collectionName).record(id).get(database);
  }

  @override
  Future<List<JsonType>> readByIds({
    required List<String> ids,
    String idKey = 'id',
  }) async {
    final database = await db;

    if (database == null) return [];

    return _dbCollection(collectionName)
        .find(database, finder: Finder(filter: Filter.inList(idKey, ids)))
        .then((records) => records.map((snapshot) => snapshot.value).toList());
  }

  @override
  Future<List<JsonType>> readAll({
    String? orderByKey,
    bool orderByAsc = true,
  }) async {
    final database = await db;
    if (database == null) return [];

    final finder = orderByKey != null ? Finder(sortOrders: [SortOrder(orderByKey, orderByAsc)]) : Finder();
    return _dbCollection(collectionName)
        .find(database, finder: finder)
        .then((records) => records.map((snapshot) => snapshot.value).toList());
  }

  @override
  Stream<JsonType?> watch({
    required String id,
  }) {
    return Stream.fromFuture(db).switchMap((db) {
      if (db == null) return Stream.value(null);
      return _dbCollection(collectionName).record(id).onSnapshot(db).map((e) => e?.value);
    });
  }

  @override
  Stream<List<JsonType>> watchByIds({
    required List<String> ids,
    String idKey = 'id',
  }) {
    return Stream.fromFuture(db).switchMap((db) {
      if (db == null) return Stream.value([]);

      return _dbCollection(collectionName)
          .query(finder: Finder(filter: Filter.inList(idKey, ids)))
          .onSnapshots(db)
          .map((e) => e.map((snapshot) => snapshot.value).toList());
    });
  }

  @override
  Stream<List<JsonType>> watchAll({
    String? orderByKey,
    bool orderByAsc = true,
  }) {
    return Stream.fromFuture(db).switchMap((db) {
      if (db == null) return Stream.value([]);
      final finder = orderByKey != null ? Finder(sortOrders: [SortOrder(orderByKey, orderByAsc)]) : Finder();

      return _dbCollection(collectionName).query(finder: finder).onSnapshots(db).map((e) => e.map((snapshot) => snapshot.value).toList());
    });
  }

  @override
  Future<void> upsert({
    required String id,
    required JsonType data,
  }) async {
    final database = await db;
    if (database == null) return;

    await _dbCollection(collectionName).record(id).put(
          database,
          data,
          merge: true,
        );
  }

  @override
  Future<void> bulkUpsert({required List<JsonType> items, String idKey = 'id'}) async {
    final database = await db;
    if (database == null) return;

    return database.transaction((transaction) async {
      final ids = items.map((item) => item[idKey].toString()).toList();
      await _dbCollection(collectionName).records(ids).put(
            transaction,
            items,
            merge: true,
          );
    });
  }

  @override
  Future<void> remove({required String id}) async {
    final database = await db;
    if (database == null) return;

    await _dbCollection(collectionName).record(id).delete(database);
  }

  @override
  Future<void> clear() async {
    final database = await db;
    if (database == null) return;

    await _dbCollection(collectionName).drop(database);
  }
}
