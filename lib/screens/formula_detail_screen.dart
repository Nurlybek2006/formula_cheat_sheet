import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../l10n/app_localizations.dart';
import '../providers/formula_provider.dart';
import '../models/formula_model.dart';
import '../widgets/latex_display.dart';

class FormulaDetailScreen extends StatefulWidget {
  const FormulaDetailScreen({super.key});

  @override
  State<FormulaDetailScreen> createState() => _FormulaDetailScreenState();
}

class _FormulaDetailScreenState extends State<FormulaDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final id = ModalRoute.of(context)!.settings.arguments as String;
      context.read<FormulaProvider>().markViewed(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final formulaId = ModalRoute.of(context)!.settings.arguments as String;
    final l10n = AppLocalizations.of(context);
    final fp = context.watch<FormulaProvider>();
    final cs = Theme.of(context).colorScheme;

    final formula =
        fp.formulas.firstWhere((f) => f.id == formulaId, orElse: () {
      Navigator.pop(context);
      return fp.formulas.first;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          formula.titleKk,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                formula.isFavorite
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                key: ValueKey(formula.isFavorite),
                color: formula.isFavorite
                    ? Colors.amber.shade600
                    : cs.onSurface,
              ),
            ),
            tooltip: formula.isFavorite ? l10n.removeFavorite : l10n.addFavorite,
            onPressed: () => fp.toggleFavorite(formula.id),
          ),
          IconButton(
            icon: const Icon(Icons.share_rounded),
            tooltip: l10n.shareFormula,
            onPressed: () => _share(formula),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Large formula display ─────────────────────────────────
            _SectionCard(
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  LatexDisplay(
                    latex: formula.formulaLatex,
                    fontSize: 22,
                    textScaleFactor: 1.5,
                  ),
                  const SizedBox(height: 8),
                  // Difficulty badge
                  Align(
                    alignment: Alignment.centerRight,
                    child: _DifficultyBadge(
                        difficulty: formula.difficulty, l10n: l10n),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // ── Description ───────────────────────────────────────────
            _SectionHeader(title: l10n.explanation, cs: cs),
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(formula.descriptionKk,
                    style: const TextStyle(height: 1.6)),
              ),
            ),
            const SizedBox(height: 12),

            // ── Variables dictionary ───────────────────────────────────
            if (formula.variablesKk.isNotEmpty) ...[
              _SectionHeader(title: l10n.variablesDictionary, cs: cs),
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Table(
                    columnWidths: const {
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(),
                    },
                    children: formula.variablesKk.entries.map((e) {
                      return TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Text(
                              e.key,
                              style: TextStyle(
                                fontFamily: 'monospace',
                                fontWeight: FontWeight.bold,
                                color: cs.primary,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Text(e.value,
                                style: const TextStyle(height: 1.4)),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],

            // ── Example ───────────────────────────────────────────────
            if (formula.exampleKk.isNotEmpty) ...[
              _SectionHeader(title: l10n.exampleTitle, cs: cs),
              Card(
                margin: EdgeInsets.zero,
                color: cs.secondaryContainer.withAlpha(60),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(formula.exampleKk,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              height: 1.5)),
                      if (formula.exampleSolutionKk.isNotEmpty) ...[
                        const Divider(height: 20),
                        Row(
                          children: [
                            Icon(Icons.lightbulb_outline_rounded,
                                size: 16, color: cs.primary),
                            const SizedBox(width: 6),
                            Text(l10n.solutionSteps,
                                style: TextStyle(
                                    color: cs.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(formula.exampleSolutionKk,
                            style: const TextStyle(
                                fontFamily: 'monospace',
                                height: 1.6,
                                fontSize: 13)),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],

            // ── Views ─────────────────────────────────────────────────
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.visibility_outlined,
                      size: 14,
                      color: Theme.of(context).colorScheme.outline),
                  const SizedBox(width: 4),
                  Text(
                    '${formula.views} ${l10n.views}',
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.outline),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _share(FormulaModel f) {
    final text =
        '${f.titleKk}\n\n${f.formulaLatex}\n\n${f.descriptionKk}';
    Share.share(text);
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.primary.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.primary.withAlpha(40)),
      ),
      child: child,
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
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: cs.primary),
      ),
    );
  }
}

class _DifficultyBadge extends StatelessWidget {
  const _DifficultyBadge(
      {required this.difficulty, required this.l10n});
  final int difficulty;
  final AppLocalizations l10n;

  Color get _color {
    switch (difficulty) {
      case 1:
        return Colors.green.shade600;
      case 2:
        return Colors.orange.shade700;
      default:
        return Colors.red.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _color.withAlpha(25),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        l10n.difficultyLabel(difficulty),
        style: TextStyle(
            color: _color,
            fontWeight: FontWeight.bold,
            fontSize: 12),
      ),
    );
  }
}
