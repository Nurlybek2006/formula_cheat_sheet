import 'dart:convert';

class QuizResultModel {
  final String id;
  final DateTime date;
  final int mode; // 1 or 2
  final int totalQuestions;
  final int correctAnswers;
  final List<String> wrongFormulaIds;

  QuizResultModel({
    required this.id,
    required this.date,
    required this.mode,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongFormulaIds,
  });

  int get wrongAnswers => totalQuestions - correctAnswers;
  double get scorePercent =>
      totalQuestions > 0 ? correctAnswers / totalQuestions * 100 : 0;

  factory QuizResultModel.fromJson(Map<String, dynamic> json) =>
      QuizResultModel(
        id: json['id'] as String,
        date: DateTime.parse(json['date'] as String),
        mode: json['mode'] as int,
        totalQuestions: json['totalQuestions'] as int,
        correctAnswers: json['correctAnswers'] as int,
        wrongFormulaIds: (json['wrongFormulaIds'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'mode': mode,
        'totalQuestions': totalQuestions,
        'correctAnswers': correctAnswers,
        'wrongFormulaIds': wrongFormulaIds,
      };

  String toJsonString() => jsonEncode(toJson());

  factory QuizResultModel.fromJsonString(String s) =>
      QuizResultModel.fromJson(jsonDecode(s) as Map<String, dynamic>);
}
