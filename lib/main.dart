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

  // HiveService — wrap in try/catch so app always launches
  try {
    await HiveService.instance.init();
  } catch (e) {
    debugPrint('HiveService: $e');
  }

  // Non-critical services: failures don't prevent app launch
  try {
    await ConnectivityService.instance.init();
  } catch (e) {
    debugPrint('ConnectivityService: $e');
  }

  try {
    await SyncService.instance.init();
    unawaited(SyncService.instance.syncIfOnline());
  } catch (e) {
    debugPrint('SyncService: $e');
  }

  runApp(const _AppRoot());
}

// ignore: prefer_void_to_null
void unawaited(Future<void> future) {
  future.catchError((e) => debugPrint('Background sync error: $e'));
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
