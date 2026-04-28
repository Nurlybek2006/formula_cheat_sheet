import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/formula_provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/latex_display.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final qp = context.watch<QuizProvider>();

    switch (qp.state) {
      case QuizState.idle:
        return _QuizSetupScreen(l10n: l10n);
      case QuizState.running:
      case QuizState.answered:
        return _QuizQuestionScreen(l10n: l10n, qp: qp);
      case QuizState.finished:
        return _QuizResultScreen(l10n: l10n, qp: qp);
    }
  }
}

// ── Setup screen ────────────────────────────────────────────────────────────

class _QuizSetupScreen extends StatefulWidget {
  const _QuizSetupScreen({required this.l10n});
  final AppLocalizations l10n;

  @override
  State<_QuizSetupScreen> createState() => _QuizSetupScreenState();
}

class _QuizSetupScreenState extends State<_QuizSetupScreen> {
  int _selectedMode = 1;

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    final cs = Theme.of(context).colorScheme;
    final fp = context.read<FormulaProvider>();
    final qp = context.read<QuizProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.quizTitle,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.quizTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              'Сынақ режимін таңдаңыз',
              style: TextStyle(color: cs.outline),
            ),
            const SizedBox(height: 24),

            _ModeCard(
              isSelected: _selectedMode == 1,
              title: l10n.mode1Title,
              description: l10n.mode1Desc,
              icon: Icons.text_fields_rounded,
              onTap: () => setState(() => _selectedMode = 1),
              cs: cs,
            ),
            const SizedBox(height: 12),
            _ModeCard(
              isSelected: _selectedMode == 2,
              title: l10n.mode2Title,
              description: l10n.mode2Desc,
              icon: Icons.functions_rounded,
              onTap: () => setState(() => _selectedMode = 2),
              cs: cs,
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  qp.startQuiz(fp.formulas, _selectedMode);
                },
                icon: const Icon(Icons.play_arrow_rounded),
                label: Text(l10n.startQuiz),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  const _ModeCard({
    required this.isSelected,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
    required this.cs,
  });

  final bool isSelected;
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? cs.primary : cs.outlineVariant,
          width: isSelected ? 2 : 1,
        ),
        color: isSelected ? cs.primary.withAlpha(15) : cs.surface,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: (isSelected ? cs.primary : cs.outline)
                        .withAlpha(20),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon,
                      color: isSelected ? cs.primary : cs.outline),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? cs.primary : null)),
                      const SizedBox(height: 4),
                      Text(description,
                          style: TextStyle(
                              fontSize: 12, color: cs.outline)),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(Icons.check_circle_rounded,
                      color: cs.primary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Question screen ──────────────────────────────────────────────────────────

class _QuizQuestionScreen extends StatelessWidget {
  const _QuizQuestionScreen(
      {required this.l10n, required this.qp});
  final AppLocalizations l10n;
  final QuizProvider qp;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final question = qp.currentQuestion!;
    final isMode1 = qp.mode == 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${l10n.questionLabel} ${qp.currentIndex + 1} ${l10n.ofLabel} ${qp.total}'),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.read<QuizProvider>().reset(),
        ),
      ),
      body: Column(
        children: [
          // Progress bar
          TweenAnimationBuilder<double>(
            tween: Tween(
                begin: 0,
                end: (qp.currentIndex + 1) / qp.total),
            duration: const Duration(milliseconds: 300),
            builder: (_, v, __) => LinearProgressIndicator(
              value: v,
              minHeight: 4,
              backgroundColor: cs.surfaceContainerHighest,
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Question
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cs.primary.withAlpha(15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: cs.primary.withAlpha(40)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          isMode1
                              ? question.formula.titleKk
                              : l10n.selectAnswer,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: cs.onSurface),
                          textAlign: TextAlign.center,
                        ),
                        if (!isMode1) ...[
                          const SizedBox(height: 16),
                          LatexDisplay(
                              latex: question.formula.formulaLatex,
                              fontSize: 22),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Text(l10n.selectAnswer,
                      style: TextStyle(
                          color: cs.outline, fontSize: 13)),
                  const SizedBox(height: 12),

                  // Options
                  ...List.generate(question.options.length, (i) {
                    Color? bg;
                    Color? fg;
                    if (qp.hasAnswered) {
                      if (i == question.correctIndex) {
                        bg = Colors.green.shade50;
                        fg = Colors.green.shade800;
                      } else if (i == qp.selectedOption &&
                          i != question.correctIndex) {
                        bg = Colors.red.shade50;
                        fg = Colors.red.shade800;
                      }
                    } else if (i == qp.selectedOption) {
                      bg = cs.primaryContainer;
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                        onTap: () =>
                            context.read<QuizProvider>().selectAnswer(i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: bg ?? cs.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: bg != null
                                  ? (fg ?? cs.outline)
                                  : cs.outlineVariant,
                              width: bg != null ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (fg ?? cs.outline)
                                      .withAlpha(25),
                                ),
                                child: Center(
                                  child: Text(
                                    String.fromCharCode(65 + i),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: fg ?? cs.outline,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: isMode1
                                    ? LatexDisplay(
                                        latex: question.options[i],
                                        fontSize: 14,
                                        color: fg ?? cs.onSurface,
                                      )
                                    : Text(
                                        question.options[i],
                                        style: TextStyle(
                                            color: fg ?? cs.onSurface),
                                      ),
                              ),
                              if (qp.hasAnswered &&
                                  i == question.correctIndex)
                                Icon(Icons.check_circle_rounded,
                                    color: Colors.green.shade700,
                                    size: 20),
                              if (qp.hasAnswered &&
                                  i == qp.selectedOption &&
                                  i != question.correctIndex)
                                Icon(Icons.cancel_rounded,
                                    color: Colors.red.shade700, size: 20),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  if (qp.hasAnswered) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: qp.answers.last
                            ? Colors.green.shade50
                            : Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        qp.answers.last
                            ? l10n.correctAnswer
                            : l10n.wrongAnswer,
                        style: TextStyle(
                          color: qp.answers.last
                              ? Colors.green.shade800
                              : Colors.red.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Next button
          if (qp.hasAnswered)
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () =>
                      context.read<QuizProvider>().nextQuestion(),
                  child: Text(
                    qp.currentIndex < qp.total - 1
                        ? l10n.nextQuestion
                        : l10n.finish,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Result screen ────────────────────────────────────────────────────────────

class _QuizResultScreen extends StatelessWidget {
  const _QuizResultScreen({required this.l10n, required this.qp});
  final AppLocalizations l10n;
  final QuizProvider qp;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final pct = qp.total > 0
        ? (qp.correctCount / qp.total * 100).round()
        : 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.quizResults,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.quizComplete,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 32),
              // Score circle
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _scoreColor(pct).withAlpha(20),
                  border: Border.all(
                      color: _scoreColor(pct), width: 4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$pct%',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: _scoreColor(pct)),
                    ),
                    Text(
                      l10n.yourScore,
                      style: TextStyle(
                          color: _scoreColor(pct), fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _StatRow(
                icon: Icons.check_circle_rounded,
                color: Colors.green.shade700,
                label: l10n.correctAnswers,
                value: '${qp.correctCount}',
              ),
              const SizedBox(height: 12),
              _StatRow(
                icon: Icons.cancel_rounded,
                color: Colors.red.shade700,
                label: l10n.wrongAnswers,
                value: '${qp.wrongCount}',
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.refresh_rounded),
                      label: Text(l10n.retry),
                      onPressed: () =>
                          context.read<QuizProvider>().reset(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      icon: const Icon(Icons.home_rounded),
                      label: Text(l10n.finish),
                      onPressed: () =>
                          context.read<QuizProvider>().reset(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _scoreColor(int pct) {
    if (pct >= 80) return Colors.green.shade700;
    if (pct >= 50) return Colors.orange.shade700;
    return Colors.red.shade700;
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color color;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(width: 12),
        Text(label,
            style: const TextStyle(fontSize: 15)),
        const Spacer(),
        Text(value,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color)),
      ],
    );
  }
}
