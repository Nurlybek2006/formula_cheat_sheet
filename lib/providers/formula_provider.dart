import 'package:flutter/material.dart';
import '../services/hive_service.dart';
import '../models/subject_model.dart';
import '../models/topic_model.dart';
import '../models/formula_model.dart';

/// Central provider for all formula/subject/topic/favorites/recent data.
class FormulaProvider extends ChangeNotifier {
  final _hive = HiveService.instance;

  List<SubjectModel> _subjects = [];
  List<TopicModel> _topics = [];
  List<FormulaModel> _formulas = [];
  Set<String> _favoriteIds = {};
  List<String> _recentIds = [];
  FormulaModel? _formulaOfDay;

  // Filters
  String _searchQuery = '';
  String? _filterSubjectId;
  String? _filterTopicId;
  int? _filterDifficulty; // 1, 2, or 3

  bool _loaded = false;

  // ── Getters ─────────────────────────────────────────────────────────────

  List<SubjectModel> get subjects => _subjects;
  List<TopicModel> get topics => _topics;
  List<FormulaModel> get formulas => _formulas;
  Set<String> get favoriteIds => _favoriteIds;
  List<FormulaModel> get favoriteFormulas =>
      _formulas.where((f) => _favoriteIds.contains(f.id)).toList();
  List<FormulaModel> get recentFormulas => _recentIds
      .map((id) => _formulas.firstWhere((f) => f.id == id,
          orElse: () => _formulas.first))
      .where((f) => _recentIds.contains(f.id))
      .toList();
  FormulaModel? get formulaOfDay => _formulaOfDay;
  bool get loaded => _loaded;

  String get searchQuery => _searchQuery;
  String? get filterSubjectId => _filterSubjectId;
  String? get filterTopicId => _filterTopicId;
  int? get filterDifficulty => _filterDifficulty;

  // ── Load ────────────────────────────────────────────────────────────────

  Future<void> loadData() async {
    _subjects = _hive.getSubjects();
    _topics = _hive.getTopics();
    _formulas = _hive.getFormulas();
    _favoriteIds = _hive.getFavoriteIds();
    _recentIds = _hive.getRecentIds();
    _pickFormulaOfDay();
    _loaded = true;
    notifyListeners();
  }

  void _pickFormulaOfDay() {
    if (_formulas.isEmpty) return;
    final dayIndex =
        DateTime.now().millisecondsSinceEpoch ~/ 86400000 % _formulas.length;
    _formulaOfDay = _formulas[dayIndex];
  }

  // ── Subject helpers ──────────────────────────────────────────────────────

  SubjectModel? subjectById(String id) =>
      _subjects.firstWhere((s) => s.id == id, orElse: () => _subjects.first);

  int formulaCountForSubject(String subjectId) =>
      _formulas.where((f) => f.subjectId == subjectId).length;

  int formulaCountForTopic(String topicId) =>
      _formulas.where((f) => f.topicId == topicId).length;

  List<TopicModel> topicsForSubject(String subjectId) =>
      _topics.where((t) => t.subjectId == subjectId).toList();

  List<FormulaModel> formulasForTopic(String topicId) =>
      _formulas.where((f) => f.topicId == topicId).toList();

  List<FormulaModel> formulasForSubject(String subjectId) =>
      _formulas.where((f) => f.subjectId == subjectId).toList();

  // ── Filtered / searched formulas ────────────────────────────────────────

  List<FormulaModel> get filteredFormulas {
    var list = List<FormulaModel>.from(_formulas);

    if (_filterSubjectId != null) {
      list = list.where((f) => f.subjectId == _filterSubjectId).toList();
    }
    if (_filterTopicId != null) {
      list = list.where((f) => f.topicId == _filterTopicId).toList();
    }
    if (_filterDifficulty != null) {
      list = list.where((f) => f.difficulty == _filterDifficulty).toList();
    }
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      list = list.where((f) {
        return f.titleKk.toLowerCase().contains(q) ||
            f.descriptionKk.toLowerCase().contains(q) ||
            f.formulaLatex.toLowerCase().contains(q) ||
            f.variablesKk.values.any((v) => v.toLowerCase().contains(q));
      }).toList();
    }
    return list;
  }

  List<FormulaModel> searchFormulas(String query) {
    if (query.isEmpty) return [];
    final q = query.toLowerCase();
    return _formulas.where((f) {
      return f.titleKk.toLowerCase().contains(q) ||
          f.titleRu.toLowerCase().contains(q) ||
          f.descriptionKk.toLowerCase().contains(q) ||
          f.formulaLatex.toLowerCase().contains(q);
    }).toList();
  }

  void setSearchQuery(String q) {
    _searchQuery = q;
    notifyListeners();
  }

  void setFilterSubject(String? id) {
    _filterSubjectId = id;
    _filterTopicId = null;
    notifyListeners();
  }

  void setFilterTopic(String? id) {
    _filterTopicId = id;
    notifyListeners();
  }

  void setFilterDifficulty(int? d) {
    _filterDifficulty = d;
    notifyListeners();
  }

  void clearFilters() {
    _filterSubjectId = null;
    _filterTopicId = null;
    _filterDifficulty = null;
    _searchQuery = '';
    notifyListeners();
  }

  // ── Favorites ───────────────────────────────────────────────────────────

  bool isFavorite(String formulaId) => _favoriteIds.contains(formulaId);

  Future<void> toggleFavorite(String formulaId) async {
    if (_favoriteIds.contains(formulaId)) {
      _favoriteIds.remove(formulaId);
      await _hive.removeFavorite(formulaId);
    } else {
      _favoriteIds.add(formulaId);
      await _hive.addFavorite(formulaId);
    }
    // Update the formula list in memory
    final idx = _formulas.indexWhere((f) => f.id == formulaId);
    if (idx != -1) {
      _formulas[idx] = _formulas[idx]
          .copyWith(isFavorite: _favoriteIds.contains(formulaId));
    }
    notifyListeners();
  }

  // ── Recent ───────────────────────────────────────────────────────────────

  Future<void> markViewed(String formulaId) async {
    _recentIds
      ..remove(formulaId)
      ..insert(0, formulaId);
    if (_recentIds.length > 3) _recentIds = _recentIds.sublist(0, 3);
    await _hive.addRecent(formulaId);
    await _hive.incrementViews(formulaId);
    final idx = _formulas.indexWhere((f) => f.id == formulaId);
    if (idx != -1) {
      _formulas[idx] = _formulas[idx].copyWith(views: _formulas[idx].views + 1);
    }
    notifyListeners();
  }

  // ── Favorites grouped by subject ────────────────────────────────────────

  Map<SubjectModel, List<FormulaModel>> get favoritesBySubject {
    final map = <SubjectModel, List<FormulaModel>>{};
    for (final s in _subjects) {
      final list = favoriteFormulas.where((f) => f.subjectId == s.id).toList();
      if (list.isNotEmpty) map[s] = list;
    }
    return map;
  }
}
