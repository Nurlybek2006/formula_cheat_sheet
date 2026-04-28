import 'package:flutter/material.dart';
import '../models/formula_model.dart';
import '../l10n/app_localizations.dart';
import 'latex_display.dart';

class FormulaCard extends StatelessWidget {
  const FormulaCard({
    super.key,
    required this.formula,
    required this.onTap,
    required this.onFavoriteTap,
    this.showSubject = false,
  });

  final FormulaModel formula;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final bool showSubject;

  Color _difficultyColor(BuildContext context, int d) {
    switch (d) {
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
    final l10n = AppLocalizations.of(context);
    final cs = Theme.of(context).colorScheme;
    final diffColor = _difficultyColor(context, formula.difficulty);

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      formula.titleKk,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onFavoriteTap,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        formula.isFavorite
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        key: ValueKey(formula.isFavorite),
                        color: formula.isFavorite
                            ? Colors.amber.shade600
                            : cs.outline,
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: cs.primary.withAlpha(18),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: LatexDisplay(
                    latex: formula.formulaLatex,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: diffColor.withAlpha(25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      l10n.difficultyLabel(formula.difficulty),
                      style: TextStyle(
                          fontSize: 11,
                          color: diffColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.visibility_outlined,
                      size: 14, color: cs.outline),
                  const SizedBox(width: 3),
                  Text(
                    '${formula.views}',
                    style:
                        TextStyle(fontSize: 12, color: cs.outline),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
