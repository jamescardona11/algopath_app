import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

import 'collection_name.dart';
import 'dao/dao_operations.dart';
import 'dao/dao_operations_impl.dart';

class DBService {
  static DBService? _instance;

  DBService._() {
    _init();
  }

  factory DBService() {
    _instance ??= DBService._();
    return _instance!;
  }

  final Completer<Database?> _dbCompleter = Completer<Database>();

  // Database for custom operations
  Future<Database?> get _db async => _dbCompleter.future;

  DaoOperations run(CollectionName collectionName) {
    return DaoOperationImpl(collectionName.value, _db);
  }

  Future<void> _init() async {
    final db = await _initSembast();
    _dbCompleter.complete(db);
  }

  static Future<Database> _initSembast({int version = 1}) async {
    const name = 'algo_path.db';
    final dbCompleter = Completer<Database>();
    if (kIsWeb) {
      final factory = databaseFactoryWeb;
      dbCompleter.complete(await factory.openDatabase(name));
    } else {
      final pathName = await _getDBPathWithName(name);

      final DatabaseFactory dbFactory = databaseFactoryIo;
      dbCompleter.complete(await dbFactory.openDatabase(pathName, version: version));
    }

    return dbCompleter.future;
  }

  static Future<String> _getDBPathWithName(String name) async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    return '${dir.path}/$name';
  }
}
