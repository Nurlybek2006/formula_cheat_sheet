import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/formula_provider.dart';
import '../models/formula_model.dart';
import '../utils/app_routes.dart';
import '../widgets/formula_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _ctrl = TextEditingController();
  List<FormulaModel> _results = [];

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _search(String q, FormulaProvider fp) {
    setState(() => _results = fp.searchFormulas(q));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final fp = context.read<FormulaProvider>();
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _ctrl,
          autofocus: true,
          onChanged: (q) => _search(q, fp),
          decoration: InputDecoration(
            hintText: l10n.searchHint,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            filled: false,
          ),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          if (_ctrl.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear_rounded),
              onPressed: () {
                _ctrl.clear();
                setState(() => _results = []);
              },
            ),
        ],
      ),
      body: _ctrl.text.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_rounded,
                      size: 72,
                      color: cs.outline.withAlpha(100)),
                  const SizedBox(height: 16),
                  Text(l10n.searchHint,
                      style: TextStyle(color: cs.outline)),
                ],
              ),
            )
          : _results.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_off_rounded,
                          size: 72,
                          color: cs.outline.withAlpha(100)),
                      const SizedBox(height: 16),
                      Text(l10n.noResults,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium),
                      const SizedBox(height: 8),
                      Text(l10n.noResultsDesc,
                          style:
                              TextStyle(color: cs.outline)),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  itemCount: _results.length,
                  itemBuilder: (ctx, i) {
                    final f = _results[i];
                    return FormulaCard(
                      formula: f,
                      onTap: () => Navigator.pushNamed(
                          context, AppRoutes.formulaDetail,
                          arguments: f.id),
                      onFavoriteTap: () =>
                          context.read<FormulaProvider>().toggleFavorite(f.id),
                    );
                  },
                ),
    );
  }
}
