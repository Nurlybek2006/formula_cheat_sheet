import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/formula_provider.dart';
import '../models/formula_model.dart';
import '../models/topic_model.dart';
import '../models/subject_model.dart';
import '../utils/app_routes.dart';
import '../widgets/formula_card.dart';

/// Displays a filtered/searched list of formulas.
/// Accepts optional route arguments:
///   { 'topicId': String }  — filter by topic
///   { 'subjectId': String } — filter by subject
class FormulasListScreen extends StatefulWidget {
  const FormulasListScreen({super.key});

  @override
  State<FormulasListScreen> createState() => _FormulasListScreenState();
}

class _FormulasListScreenState extends State<FormulasListScreen> {
  final _searchCtrl = TextEditingController();
  String _searchQuery = '';
  String? _topicId;
  String? _subjectId;
  int? _difficulty;
  bool _argsParsed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Read route arguments ONCE, immediately (no async, no race condition)
    if (!_argsParsed) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Map) {
        _topicId = args['topicId'] as String?;
        _subjectId = args['subjectId'] as String?;
      }
      _argsParsed = true;
    }
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  List<FormulaModel> _applyFilters(List<FormulaModel> all) {
    var list = List<FormulaModel>.from(all);
    if (_subjectId != null) {
      list = list.where((f) => f.subjectId == _subjectId).toList();
    }
    if (_topicId != null) {
      list = list.where((f) => f.topicId == _topicId).toList();
    }
    if (_difficulty != null) {
      list = list.where((f) => f.difficulty == _difficulty).toList();
    }
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      list = list.where((f) {
        return f.titleKk.toLowerCase().contains(q) ||
            f.descriptionKk.toLowerCase().contains(q) ||
            f.formulaLatex.toLowerCase().contains(q);
      }).toList();
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final fp = context.watch<FormulaProvider>();
    final cs = Theme.of(context).colorScheme;

    if (!fp.loaded) {
      return Scaffold(
        appBar: AppBar(
          title: Text(l10n.formulasTitle,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final formulas = _applyFilters(fp.formulas);

    // Build active filter chips
    final chips = <Widget>[];
    if (_subjectId != null) {
      final s = fp.subjects.firstWhere(
        (s) => s.id == _subjectId,
        orElse: () => SubjectModel(
            id: _subjectId!,
            nameKk: _subjectId!,
            nameRu: '',
            nameEn: '',
            icon: '',
            order: 0),
      );
      chips.add(Chip(
        label: Text(s.nameKk),
        onDeleted: () => setState(() => _subjectId = null),
        backgroundColor: cs.primaryContainer,
      ));
    }
    if (_topicId != null) {
      final t = fp.topics.firstWhere(
        (t) => t.id == _topicId,
        orElse: () => TopicModel(
            id: '',
            subjectId: '',
            nameKk: _topicId!,
            nameRu: '',
            nameEn: '',
            descriptionKk: ''),
      );
      chips.add(Chip(
        label: Text(t.nameKk),
        onDeleted: () => setState(() => _topicId = null),
        backgroundColor: cs.secondaryContainer,
      ));
    }
    if (_difficulty != null) {
      chips.add(Chip(
        label: Text(l10n.difficultyLabel(_difficulty!)),
        onDeleted: () => setState(() => _difficulty = null),
        backgroundColor: cs.tertiaryContainer,
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.formulasTitle,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () => _showFilterSheet(context, l10n, fp),
          ),
        ],
      ),
      body: Column(
        children: [
          // ── Search bar ────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              controller: _searchCtrl,
              onChanged: (q) => setState(() => _searchQuery = q),
              decoration: InputDecoration(
                hintText: l10n.searchHint,
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded),
                        onPressed: () {
                          _searchCtrl.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
              ),
            ),
          ),

          // ── Active filter chips ───────────────────────────────────────
          if (chips.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(spacing: 8, children: chips),
              ),
            ),

          // ── Formula list ──────────────────────────────────────────────
          Expanded(
            child: formulas.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off_rounded,
                            size: 64, color: cs.outline),
                        const SizedBox(height: 16),
                        Text(
                          l10n.noFormulas,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: cs.onSurface),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 4, bottom: 16),
                    itemCount: formulas.length,
                    itemBuilder: (ctx, i) {
                      final f = formulas[i];
                      return FormulaCard(
                        formula: f,
                        onTap: () => Navigator.pushNamed(
                            context, AppRoutes.formulaDetail,
                            arguments: f.id),
                        onFavoriteTap: () => fp.toggleFavorite(f.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet(
      BuildContext context, AppLocalizations l10n, FormulaProvider fp) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (_) => _FilterSheet(
        subjects: fp.subjects,
        selectedSubjectId: _subjectId,
        selectedDifficulty: _difficulty,
        l10n: l10n,
        onApply: ({String? subjectId, int? difficulty}) {
          setState(() {
            _subjectId = subjectId;
            if (subjectId != null) _topicId = null;
            _difficulty = difficulty;
          });
        },
      ),
    );
  }
}

// ── Filter bottom sheet ──────────────────────────────────────────────────────

class _FilterSheet extends StatefulWidget {
  const _FilterSheet({
    required this.subjects,
    required this.selectedSubjectId,
    required this.selectedDifficulty,
    required this.l10n,
    required this.onApply,
  });

  final List<SubjectModel> subjects;
  final String? selectedSubjectId;
  final int? selectedDifficulty;
  final AppLocalizations l10n;
  final void Function({String? subjectId, int? difficulty}) onApply;

  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  String? _subjectId;
  int? _difficulty;

  @override
  void initState() {
    super.initState();
    _subjectId = widget.selectedSubjectId;
    _difficulty = widget.selectedDifficulty;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(l10n.filterTitle,
                  style: Theme.of(context).textTheme.titleLarge),
              const Spacer(),
              TextButton(
                onPressed: () =>
                    setState(() {
                      _subjectId = null;
                      _difficulty = null;
                    }),
                child: Text(l10n.clearFilter),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Subject filter
          Text(l10n.navSubjects,
              style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ChoiceChip(
                label: Text(l10n.allSubjects),
                selected: _subjectId == null,
                onSelected: (_) => setState(() => _subjectId = null),
              ),
              ...widget.subjects.map((s) => ChoiceChip(
                    label: Text(s.nameKk),
                    selected: _subjectId == s.id,
                    onSelected: (_) => setState(() => _subjectId = s.id),
                  )),
            ],
          ),
          const SizedBox(height: 16),

          // Difficulty filter
          Text(l10n.difficulty,
              style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              ChoiceChip(
                label: Text(l10n.difficultyAll),
                selected: _difficulty == null,
                onSelected: (_) => setState(() => _difficulty = null),
              ),
              ChoiceChip(
                label: Text(l10n.easy),
                selected: _difficulty == 1,
                selectedColor: Colors.green.shade100,
                onSelected: (_) => setState(() => _difficulty = 1),
              ),
              ChoiceChip(
                label: Text(l10n.medium),
                selected: _difficulty == 2,
                selectedColor: Colors.orange.shade100,
                onSelected: (_) => setState(() => _difficulty = 2),
              ),
              ChoiceChip(
                label: Text(l10n.hard),
                selected: _difficulty == 3,
                selectedColor: Colors.red.shade100,
                onSelected: (_) => setState(() => _difficulty = 3),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                widget.onApply(
                    subjectId: _subjectId, difficulty: _difficulty);
                Navigator.pop(context);
              },
              child: const Text('Қолдану'),
            ),
          ),
        ],
      ),
    );
  }
}
