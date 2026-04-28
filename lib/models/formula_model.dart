import 'dart:convert';

class FormulaModel {
  final String id;
  final String subjectId;
  final String topicId;
  final String titleKk;
  final String titleRu;
  final String titleEn;
  final String formulaLatex;
  final String descriptionKk;
  final String descriptionRu;
  final Map<String, String> variablesKk; // symbol → meaning in Kazakh
  final String exampleKk;
  final String exampleSolutionKk;
  final int difficulty; // 1=easy, 2=medium, 3=hard
  int views;
  bool isFavorite;

  FormulaModel({
    required this.id,
    required this.subjectId,
    required this.topicId,
    required this.titleKk,
    required this.titleRu,
    required this.titleEn,
    required this.formulaLatex,
    required this.descriptionKk,
    required this.descriptionRu,
    required this.variablesKk,
    required this.exampleKk,
    required this.exampleSolutionKk,
    required this.difficulty,
    this.views = 0,
    this.isFavorite = false,
  });

  factory FormulaModel.fromJson(Map<String, dynamic> json) => FormulaModel(
        id: json['id'] as String,
        subjectId: json['subjectId'] as String,
        topicId: json['topicId'] as String,
        titleKk: json['titleKk'] as String,
        titleRu: json['titleRu'] as String? ?? json['titleKk'] as String,
        titleEn: json['titleEn'] as String? ?? json['titleKk'] as String,
        formulaLatex: json['formulaLatex'] as String,
        descriptionKk: json['descriptionKk'] as String,
        descriptionRu: json['descriptionRu'] as String? ?? '',
        variablesKk: (json['variablesKk'] as Map<String, dynamic>?)
                ?.map((k, v) => MapEntry(k, v as String)) ??
            {},
        exampleKk: json['exampleKk'] as String? ?? '',
        exampleSolutionKk: json['exampleSolutionKk'] as String? ?? '',
        difficulty: json['difficulty'] as int? ?? 1,
        views: json['views'] as int? ?? 0,
        isFavorite: json['isFavorite'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'subjectId': subjectId,
        'topicId': topicId,
        'titleKk': titleKk,
        'titleRu': titleRu,
        'titleEn': titleEn,
        'formulaLatex': formulaLatex,
        'descriptionKk': descriptionKk,
        'descriptionRu': descriptionRu,
        'variablesKk': variablesKk,
        'exampleKk': exampleKk,
        'exampleSolutionKk': exampleSolutionKk,
        'difficulty': difficulty,
        'views': views,
        'isFavorite': isFavorite,
      };

  String toJsonString() => jsonEncode(toJson());

  factory FormulaModel.fromJsonString(String s) =>
      FormulaModel.fromJson(jsonDecode(s) as Map<String, dynamic>);

  FormulaModel copyWith({bool? isFavorite, int? views}) => FormulaModel(
        id: id,
        subjectId: subjectId,
        topicId: topicId,
        titleKk: titleKk,
        titleRu: titleRu,
        titleEn: titleEn,
        formulaLatex: formulaLatex,
        descriptionKk: descriptionKk,
        descriptionRu: descriptionRu,
        variablesKk: variablesKk,
        exampleKk: exampleKk,
        exampleSolutionKk: exampleSolutionKk,
        difficulty: difficulty,
        views: views ?? this.views,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  String localizedTitle(String lang) {
    switch (lang) {
      case 'ru':
        return titleRu.isNotEmpty ? titleRu : titleKk;
      case 'en':
        return titleEn.isNotEmpty ? titleEn : titleKk;
      default:
        return titleKk;
    }
  }
}
