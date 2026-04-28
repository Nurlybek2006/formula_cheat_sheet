import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/formula_provider.dart';
import '../models/topic_model.dart';
import '../utils/app_routes.dart';

/// Shows the list of topics for a given subject (passed as route argument).
class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjectId = ModalRoute.of(context)!.settings.arguments as String;
    final l10n = AppLocalizations.of(context);
    final fp = context.watch<FormulaProvider>();
    final subject = fp.subjectById(subjectId);
    final topics = fp.topicsForSubject(subjectId);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(subject?.nameKk ?? l10n.topicsTitle,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.search),
          ),
        ],
      ),
      body: topics.isEmpty
          ? Center(
              child: Text(l10n.noFormulas,
                  style: TextStyle(color: cs.outline)))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: topics.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (ctx, i) => _TopicTile(
                topic: topics[i],
                count: fp.formulaCountForTopic(topics[i].id),
                onTap: () => Navigator.pushNamed(
                    context, AppRoutes.formulasList,
                    arguments: {'topicId': topics[i].id}),
              ),
            ),
    );
  }
}

class _TopicTile extends StatelessWidget {
  const _TopicTile({
    required this.topic,
    required this.count,
    required this.onTap,
  });

  final TopicModel topic;
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        onTap: onTap,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: cs.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.functions_rounded,
              color: cs.primary, size: 22),
        ),
        title: Text(topic.nameKk,
            style: Theme.of(context).textTheme.titleSmall),
        subtitle: Text(
          topic.descriptionKk,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: cs.outline, fontSize: 12),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('$count',
                style: TextStyle(
                    color: cs.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            Text('формула',
                style: TextStyle(color: cs.outline, fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
