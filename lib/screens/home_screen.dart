import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/formula_provider.dart';
import '../utils/app_routes.dart';
import '../widgets/subject_card.dart';
import '../widgets/formula_card.dart';
import '../widgets/latex_display.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final fp = context.watch<FormulaProvider>();
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            tooltip: l10n.searchTitle,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.search),
          ),
        ],
      ),
      body: fp.loaded
          ? _Body(l10n: l10n, fp: fp, cs: cs)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body(
      {required this.l10n, required this.fp, required this.cs});

  final AppLocalizations l10n;
  final FormulaProvider fp;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => fp.loadData(),
      child: CustomScrollView(
        slivers: [
          // ── Formula of Day ─────────────────────────────────────────────
          if (fp.formulaOfDay != null)
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: _FormulaOfDayBanner(
                    formula: fp.formulaOfDay!, l10n: l10n, cs: cs),
              ),
            ),

          // ── Recent formulas ────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(l10n.recentFormulas,
                      style:
                          Theme.of(context).textTheme.titleMedium),
                  const Spacer(),
                  if (fp.recentFormulas.isNotEmpty)
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                          context, AppRoutes.formulasList),
                      child: Text(l10n.seeAll),
                    ),
                ],
              ),
            ),
          ),

          if (fp.recentFormulas.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(l10n.noRecentFormulas,
                    style: TextStyle(color: cs.outline)),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, i) {
                  final f = fp.recentFormulas[i];
                  return FormulaCard(
                    formula: f,
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutes.formulaDetail,
                        arguments: f.id),
                    onFavoriteTap: () => fp.toggleFavorite(f.id),
                  );
                },
                childCount: fp.recentFormulas.length,
              ),
            ),

          // ── Subjects ───────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(l10n.navSubjects,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            sliver: SliverGrid(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.25,
              ),
              delegate: SliverChildBuilderDelegate(
                (ctx, i) {
                  final s = fp.subjects[i];
                  return SubjectCard(
                    subject: s,
                    formulaCount: fp.formulaCountForSubject(s.id),
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutes.topics,
                        arguments: s.id),
                  );
                },
                childCount: fp.subjects.length,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class _FormulaOfDayBanner extends StatelessWidget {
  const _FormulaOfDayBanner(
      {required this.formula, required this.l10n, required this.cs});

  final dynamic formula;
  final AppLocalizations l10n;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [cs.primary, cs.tertiary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: cs.primary.withAlpha(80),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.wb_sunny_rounded,
                  color: Colors.white, size: 18),
              const SizedBox(width: 6),
              Text(
                l10n.formulaOfDay,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            formula.titleKk,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(30),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: LatexDisplay(
                latex: formula.formulaLatex,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () => Navigator.pushNamed(
                  context, AppRoutes.formulaDetail,
                  arguments: formula.id),
              icon: const Icon(Icons.arrow_forward_ios_rounded,
                  size: 14, color: Colors.white),
              label: const Text('Толығырақ',
                  style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withAlpha(30)),
            ),
          ),
        ],
      ),
    );
  }
}
