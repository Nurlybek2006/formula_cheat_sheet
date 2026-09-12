import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/hive_service.dart';
import 'services/connectivity_service.dart';
import 'services/sync_service.dart';
import 'providers/formula_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/quiz_provider.dart';
import 'providers/settings_provider.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise services — wrap each in try/catch so a crash doesn't kill app
  await HiveService.instance.init();

  try {
    await ConnectivityService.instance.init();
  } catch (e) {
    debugPrint('ConnectivityService.init error: $e');
  }

  try {
    await SyncService.instance.init();
    SyncService.instance.syncIfOnline();
  } catch (e) {
    debugPrint('SyncService.init error: $e');
  }

  runApp(const _AppRoot());
}

class _AppRoot extends StatelessWidget {
  const _AppRoot();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(
          create: (_) => FormulaProvider()..loadData(),
        ),
        ChangeNotifierProvider(create: (_) => QuizProvider()),
      ],
      child: const FormulaApp(),
    );
  }
}


