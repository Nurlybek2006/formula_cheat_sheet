import 'package:flutter/material.dart';
import '../services/hive_service.dart';

class SettingsProvider extends ChangeNotifier {
  final _hive = HiveService.instance;

  Locale _locale = const Locale('kk');
  bool _notificationsEnabled = false;
  TimeOfDay _notificationTime = const TimeOfDay(hour: 8, minute: 0);

  Locale get locale => _locale;
  bool get notificationsEnabled => _notificationsEnabled;
  TimeOfDay get notificationTime => _notificationTime;

  SettingsProvider() {
    _load();
  }

  void _load() {
    final lang = _hive.getSetting('language') ?? 'kk';
    _locale = Locale(lang);
    _notificationsEnabled =
        (_hive.getSetting('notifications') ?? 'false') == 'true';
    final h = int.tryParse(_hive.getSetting('notif_hour') ?? '8') ?? 8;
    final m = int.tryParse(_hive.getSetting('notif_min') ?? '0') ?? 0;
    _notificationTime = TimeOfDay(hour: h, minute: m);
  }

  Future<void> setLocale(String lang) async {
    _locale = Locale(lang);
    await _hive.setSetting('language', lang);
    notifyListeners();
  }

  Future<void> setNotificationsEnabled(bool v) async {
    _notificationsEnabled = v;
    await _hive.setSetting('notifications', v.toString());
    notifyListeners();
  }

  Future<void> setNotificationTime(TimeOfDay t) async {
    _notificationTime = t;
    await _hive.setSetting('notif_hour', t.hour.toString());
    await _hive.setSetting('notif_min', t.minute.toString());
    notifyListeners();
  }
}
