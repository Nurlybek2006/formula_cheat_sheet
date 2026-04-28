import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../models/formula_model.dart';
import '../models/subject_model.dart';
import '../models/topic_model.dart';
import '../models/quiz_result_model.dart';
import '../data/seed_data.dart';

/// Hive box names
const _kFormulas = 'formulas';
const _kSubjects = 'subjects';
const _kTopics = 'topics';
const _kUserData = 'user_data';
const _kQuizResults = 'quiz_results';
const _kFavoritesKey = 'favorites';
const _kRecentKey = 'recent';
const _kSeededKey = 'seeded';

class HiveService {
  HiveService._();
  static final HiveService instance = HiveService._();

  late Box<String> _formulasBox;
  late Box<String> _subjectsBox;
  late Box<String> _topicsBox;
  late Box<String> _userDataBox;
  late Box<String> _quizResultsBox;

  Future<void> init() async {
    // Use app support directory to avoid OneDrive/iCloud sync issues
    if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
      final dir = await getApplicationSupportDirectory();
      Hive.init('${dir.path}/hive_data');
    } else {
      await Hive.initFlutter();
    }
    _formulasBox = await Hive.openBox<String>(_kFormulas);
    _subjectsBox = await Hive.openBox<String>(_kSubjects);
    _topicsBox = await Hive.openBox<String>(_kTopics);
    _userDataBox = await Hive.openBox<String>(_kUserData);
    _quizResultsBox = await Hive.openBox<String>(_kQuizResults);

    // Seed on first run
    if (_userDataBox.get(_kSeededKey) == null) {
      await _seedData();
      await _userDataBox.put(_kSeededKey, 'true');
    }
  }

  // ── SEED ────────────────────────────────────────────────────────────────

  Future<void> _seedData() async {
    for (final s in kSubjects) {
      await _subjectsBox.put(s.id, s.toJsonString());
    }
    for (final t in kTopics) {
      await _topicsBox.put(t.id, t.toJsonString());
    }
    for (final f in kFormulas) {
      await _formulasBox.put(f.id, f.toJsonString());
    }
  }

  // ── SUBJECTS ────────────────────────────────────────────────────────────

  List<SubjectModel> getSubjects() {
    return _subjectsBox.values
        .map((s) => SubjectModel.fromJsonString(s))
        .toList()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  Future<void> saveSubject(SubjectModel s) async {
    await _subjectsBox.put(s.id, s.toJsonString());
  }

  // ── TOPICS ──────────────────────────────────────────────────────────────

  List<TopicModel> getTopics() {
    return _topicsBox.values
        .map((t) => TopicModel.fromJsonString(t))
        .toList();
  }

  List<TopicModel> getTopicsBySubject(String subjectId) {
    return getTopics().where((t) => t.subjectId == subjectId).toList();
  }

  Future<void> saveTopic(TopicModel t) async {
    await _topicsBox.put(t.id, t.toJsonString());
  }

  // ── FORMULAS ────────────────────────────────────────────────────────────

  List<FormulaModel> getFormulas() {
    final favIds = getFavoriteIds();
    return _formulasBox.values.map((s) {
      final f = FormulaModel.fromJsonString(s);
      f.isFavorite = favIds.contains(f.id);
      return f;
    }).toList();
  }

  List<FormulaModel> getFormulasByTopic(String topicId) {
    return getFormulas().where((f) => f.topicId == topicId).toList();
  }

  List<FormulaModel> getFormulasBySubject(String subjectId) {
    return getFormulas().where((f) => f.subjectId == subjectId).toList();
  }

  FormulaModel? getFormula(String id) {
    final s = _formulasBox.get(id);
    if (s == null) return null;
    final f = FormulaModel.fromJsonString(s);
    f.isFavorite = getFavoriteIds().contains(f.id);
    return f;
  }

  Future<void> saveFormula(FormulaModel f) async {
    await _formulasBox.put(f.id, f.toJsonString());
  }

  Future<void> incrementViews(String formulaId) async {
    final f = getFormula(formulaId);
    if (f == null) return;
    f.views++;
    await saveFormula(f);
  }

  // ── FAVORITES ───────────────────────────────────────────────────────────

  Set<String> getFavoriteIds() {
    final raw = _userDataBox.get(_kFavoritesKey);
    if (raw == null) return {};
    return (jsonDecode(raw) as List).map((e) => e as String).toSet();
  }

  Future<void> saveFavoriteIds(Set<String> ids) async {
    await _userDataBox.put(_kFavoritesKey, jsonEncode(ids.toList()));
  }

  Future<void> addFavorite(String formulaId) async {
    final ids = getFavoriteIds()..add(formulaId);
    await saveFavoriteIds(ids);
  }

  Future<void> removeFavorite(String formulaId) async {
    final ids = getFavoriteIds()..remove(formulaId);
    await saveFavoriteIds(ids);
  }

  // ── RECENT ──────────────────────────────────────────────────────────────

  List<String> getRecentIds() {
    final raw = _userDataBox.get(_kRecentKey);
    if (raw == null) return [];
    return (jsonDecode(raw) as List).map((e) => e as String).toList();
  }

  Future<void> addRecent(String formulaId) async {
    final ids = getRecentIds()
      ..remove(formulaId)
      ..insert(0, formulaId);
    if (ids.length > 3) ids.removeRange(3, ids.length);
    await _userDataBox.put(_kRecentKey, jsonEncode(ids));
  }

  // ── QUIZ RESULTS ─────────────────────────────────────────────────────────

  List<QuizResultModel> getQuizResults() {
    return _quizResultsBox.values
        .map((s) => QuizResultModel.fromJsonString(s))
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  Future<void> saveQuizResult(QuizResultModel r) async {
    await _quizResultsBox.put(r.id, r.toJsonString());
  }

  // ── SETTINGS ────────────────────────────────────────────────────────────

  String? getSetting(String key) => _userDataBox.get('setting_$key');

  Future<void> setSetting(String key, String value) async {
    await _userDataBox.put('setting_$key', value);
  }
}
