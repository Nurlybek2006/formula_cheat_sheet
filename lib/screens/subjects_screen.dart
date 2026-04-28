import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/formula_provider.dart';
import '../utils/app_routes.dart';
import '../widgets/subject_card.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final fp = context.watch<FormulaProvider>();

    return Scaffold(
      appBar: AppBar(
        title:
            Text(l10n.navSubjects,
                style: const TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.search),
          ),
        ],
      ),
      body: fp.loaded
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: fp.subjects.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (ctx, i) {
                  final s = fp.subjects[i];
                  return SubjectCard(
                    subject: s,
                    formulaCount: fp.formulaCountForSubject(s.id),
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutes.topics,
                        arguments: s.id),
                  );
                },
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
