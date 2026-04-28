import 'dart:math';
import 'package:flutter/material.dart';
import '../models/formula_model.dart';
import '../services/hive_service.dart';
import '../services/sync_service.dart';
import '../models/quiz_result_model.dart';

enum QuizState { idle, running, answered, finished }

class QuizQuestion {
  final FormulaModel formula;
  final List<String> options; // display strings
  final int correctIndex;

  QuizQuestion({
    required this.formula,
    required this.options,
    required this.correctIndex,
  });
}

class QuizProvider extends ChangeNotifier {
  final _hive = HiveService.instance;

  QuizState _state = QuizState.idle;
  int _mode = 1; // 1 = name→formula, 2 = formula→name
  List<QuizQuestion> _questions = [];
  int _currentIndex = 0;
  int? _selectedOption;
  List<bool> _answers = [];
  List<String> _wrongIds = [];

  QuizState get state => _state;
  int get mode => _mode;
  List<QuizQuestion> get questions => _questions;
  int get currentIndex => _currentIndex;
  QuizQuestion? get currentQuestion =>
      _questions.isEmpty ? null : _questions[_currentIndex];
  int? get selectedOption => _selectedOption;
  bool get hasAnswered => _selectedOption != null;
  List<bool> get answers => _answers;
  int get correctCount => _answers.where((a) => a).length;
  int get wrongCount => _answers.where((a) => !a).length;
  int get total => _questions.length;

  void startQuiz(List<FormulaModel> allFormulas, int mode) {
    _mode = mode;
    final rng = Random();
    // Pick up to 10 random formulas for quiz
    final pool = List<FormulaModel>.from(allFormulas)..shuffle(rng);
    final selected = pool.take(10).toList();

    _questions = selected.map((f) {
      // Build 4 options: 1 correct + 3 random wrongs
      final others = allFormulas.where((o) => o.id != f.id).toList()
        ..shuffle(rng);
      final wrongs = others.take(3).toList();

      List<String> options;
      if (mode == 1) {
        // Show name → pick correct formula LaTeX
        options = [f.formulaLatex, ...wrongs.map((w) => w.formulaLatex)];
      } else {
        // Show formula → pick correct title
        options = [f.titleKk, ...wrongs.map((w) => w.titleKk)];
      }
      options.shuffle(rng);
      final correctIdx = options.indexOf(mode == 1 ? f.formulaLatex : f.titleKk);
      return QuizQuestion(
          formula: f, options: options, correctIndex: correctIdx);
    }).toList();

    _currentIndex = 0;
    _selectedOption = null;
    _answers = [];
    _wrongIds = [];
    _state = QuizState.running;
    notifyListeners();
  }

  void selectAnswer(int optionIndex) {
    if (_state != QuizState.running || hasAnswered) return;
    _selectedOption = optionIndex;
    final correct = optionIndex == currentQuestion!.correctIndex;
    _answers.add(correct);
    if (!correct) _wrongIds.add(currentQuestion!.formula.id);
    _state = QuizState.answered;
    notifyListeners();
  }

  Future<void> nextQuestion() async {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      _selectedOption = null;
      _state = QuizState.running;
    } else {
      _state = QuizState.finished;
      await _saveResult();
    }
    notifyListeners();
  }

  Future<void> _saveResult() async {
    final result = QuizResultModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      date: DateTime.now(),
      mode: _mode,
      totalQuestions: _questions.length,
      correctAnswers: correctCount,
      wrongFormulaIds: _wrongIds,
    );
    await SyncService.instance.saveQuizResult(result);
  }

  void reset() {
    _state = QuizState.idle;
    _questions = [];
    _currentIndex = 0;
    _selectedOption = null;
    _answers = [];
    _wrongIds = [];
    notifyListeners();
  }
}
