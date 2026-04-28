import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/theme_provider.dart';
import '../providers/settings_provider.dart';
import '../utils/app_theme.dart';
import '../utils/app_routes.dart';
import '../screens/home_screen.dart';
import '../screens/subjects_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/topics_screen.dart';
import '../screens/formulas_list_screen.dart';
import '../screens/formula_detail_screen.dart';
import '../screens/search_screen.dart';

class FormulaApp extends StatelessWidget {
  const FormulaApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen to settings for locale & theme
    final settings = context.watch<SettingsProvider>();
    final theme = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Формулалар анықтамалығы',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: theme.themeMode,
      locale: settings.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => const MainShell(),
        AppRoutes.topics: (_) => const TopicsScreen(),
        AppRoutes.formulasList: (_) => const FormulasListScreen(),
        AppRoutes.formulaDetail: (_) => const FormulaDetailScreen(),
        AppRoutes.search: (_) => const SearchScreen(),
      },
    );
  }
}

/// Bottom navigation shell.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  static const _screens = [
    HomeScreen(),
    SubjectsScreen(),
    FavoritesScreen(),
    QuizScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home_rounded),
            label: l10n.navHome,
          ),
          NavigationDestination(
            icon: const Icon(Icons.book_outlined),
            selectedIcon: const Icon(Icons.book_rounded),
            label: l10n.navSubjects,
          ),
          NavigationDestination(
            icon: const Icon(Icons.star_border_rounded),
            selectedIcon: const Icon(Icons.star_rounded),
            label: l10n.navFavorites,
          ),
          NavigationDestination(
            icon: const Icon(Icons.quiz_outlined),
            selectedIcon: const Icon(Icons.quiz_rounded),
            label: l10n.navQuiz,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings_rounded),
            label: l10n.navSettings,
          ),
        ],
      ),
    );
  }
}
