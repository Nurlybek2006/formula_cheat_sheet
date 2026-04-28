import 'package:flutter/material.dart';
import '../services/hive_service.dart';

class ThemeProvider extends ChangeNotifier {
  static const _key = 'themeMode';
  final _hive = HiveService.instance;

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _load();
  }

  void _load() {
    final v = _hive.getSetting(_key);
    switch (v) {
      case 'dark':
        _themeMode = ThemeMode.dark;
        break;
      case 'light':
        _themeMode = ThemeMode.light;
        break;
      default:
        _themeMode = ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    String v;
    switch (mode) {
      case ThemeMode.dark:
        v = 'dark';
        break;
      case ThemeMode.light:
        v = 'light';
        break;
      default:
        v = 'system';
    }
    await _hive.setSetting(_key, v);
    notifyListeners();
  }
}
