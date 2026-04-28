import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/formula_provider.dart';
import '../utils/app_routes.dart';
import '../widgets/formula_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final fp = context.watch<FormulaProvider>();
    final cs = Theme.of(context).colorScheme;
    final grouped = fp.favoritesBySubject;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.navFavorites,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: grouped.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_border_rounded,
                      size: 72, color: cs.outline.withAlpha(100)),
                  const SizedBox(height: 16),
                  Text(l10n.noFavorites,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      l10n.noFavoritesDesc,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: cs.outline, height: 1.5),
                    ),
                  ),
                ],
              ),
            )
          : ListView(
              children: [
                for (final entry in grouped.entries) ...[
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(16, 16, 16, 4),
                    child: Text(
                      entry.key.nameKk,
                      style: TextStyle(
                          color: cs.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  ...entry.value.map(
                    (f) => FormulaCard(
                      formula: f,
                      onTap: () => Navigator.pushNamed(
                          context, AppRoutes.formulaDetail,
                          arguments: f.id),
                      onFavoriteTap: () => fp.toggleFavorite(f.id),
                    ),
                  ),
                ],
                const SizedBox(height: 24),
              ],
            ),
    );
  }
}
