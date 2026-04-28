import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/theme_provider.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tp = context.watch<ThemeProvider>();
    final sp = context.watch<SettingsProvider>();
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Theme ─────────────────────────────────────────────────────
          _SectionHeader(title: l10n.themeSection, cs: cs),
          Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                _ThemeTile(
                  selected: tp.themeMode == ThemeMode.system,
                  title: l10n.systemTheme,
                  icon: Icons.brightness_auto_rounded,
                  onTap: () => tp.setThemeMode(ThemeMode.system),
                ),
                const Divider(height: 1, indent: 16),
                _ThemeTile(
                  selected: tp.themeMode == ThemeMode.light,
                  title: l10n.lightMode,
                  icon: Icons.light_mode_rounded,
                  onTap: () => tp.setThemeMode(ThemeMode.light),
                ),
                const Divider(height: 1, indent: 16),
                _ThemeTile(
                  selected: tp.themeMode == ThemeMode.dark,
                  title: l10n.darkMode,
                  icon: Icons.dark_mode_rounded,
                  onTap: () => tp.setThemeMode(ThemeMode.dark),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ── Language ──────────────────────────────────────────────────
          _SectionHeader(title: l10n.languageSection, cs: cs),
          Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                _LangTile(
                  title: l10n.kazakh,
                  code: 'kk',
                  flag: '🇰🇿',
                  selected: sp.locale.languageCode == 'kk',
                  onTap: () => sp.setLocale('kk'),
                ),
                const Divider(height: 1, indent: 16),
                _LangTile(
                  title: l10n.russian,
                  code: 'ru',
                  flag: '🇷🇺',
                  selected: sp.locale.languageCode == 'ru',
                  onTap: () => sp.setLocale('ru'),
                ),
                const Divider(height: 1, indent: 16),
                _LangTile(
                  title: l10n.english,
                  code: 'en',
                  flag: '🇬🇧',
                  selected: sp.locale.languageCode == 'en',
                  onTap: () => sp.setLocale('en'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ── Notifications ─────────────────────────────────────────────
          _SectionHeader(title: l10n.notificationsSection, cs: cs),
          Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                SwitchListTile(
                  value: sp.notificationsEnabled,
                  onChanged: sp.setNotificationsEnabled,
                  secondary: Icon(Icons.notifications_outlined,
                      color: cs.primary),
                  title: Text(l10n.notificationsEnabled),
                  subtitle: const Text('Күннің формуласы хабарландыруы'),
                ),
                if (sp.notificationsEnabled) ...[
                  const Divider(height: 1, indent: 16),
                  ListTile(
                    leading: Icon(Icons.access_time_rounded,
                        color: cs.primary),
                    title: Text(l10n.notificationTime),
                    trailing: TextButton(
                      onPressed: () async {
                        final t = await showTimePicker(
                          context: context,
                          initialTime: sp.notificationTime,
                        );
                        if (t != null) sp.setNotificationTime(t);
                      },
                      child: Text(
                        sp.notificationTime.format(context),
                        style: TextStyle(
                            color: cs.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ── App info ──────────────────────────────────────────────────
          _SectionHeader(title: l10n.appInfoSection, cs: cs),
          Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              leading:
                  Icon(Icons.info_outline_rounded, color: cs.primary),
              title: Text(l10n.appName),
              subtitle: Text(l10n.version),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.cs});
  final String title;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
            color: cs.primary,
            fontWeight: FontWeight.bold,
            fontSize: 13),
      ),
    );
  }
}

class _ThemeTile extends StatelessWidget {
  const _ThemeTile({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: cs.primary),
      title: Text(title),
      trailing: selected
          ? Icon(Icons.check_rounded, color: cs.primary)
          : null,
    );
  }
}

class _LangTile extends StatelessWidget {
  const _LangTile({
    required this.title,
    required this.code,
    required this.flag,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String code;
  final String flag;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return ListTile(
      onTap: onTap,
      leading: Text(flag, style: const TextStyle(fontSize: 24)),
      title: Text(title),
      trailing: selected
          ? Icon(Icons.check_rounded, color: cs.primary)
          : null,
    );
  }
}
