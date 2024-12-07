import 'package:algopath_app/utils/logger/logger.dart';
import 'package:flutter/material.dart';

import 'config/navigation/router_config.dart';
import 'config/theme/app_theme.dart';
import 'data/database/init/init_database_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final initDb = InitDatabaseData();
  await initDb.init();
  AppLogger().d('Database initialized');
  AppLogger().d(initDb.log);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AlgoPath',
      theme: AppTheme.appTheme(),
      routerConfig: router,
    );
  }
}
