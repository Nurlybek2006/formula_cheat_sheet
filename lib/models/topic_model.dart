import 'dart:convert';

class TopicModel {
  final String id;
  final String subjectId;
  final String nameKk;
  final String nameRu;
  final String nameEn;
  final String descriptionKk;

  const TopicModel({
    required this.id,
    required this.subjectId,
    required this.nameKk,
    required this.nameRu,
    required this.nameEn,
    required this.descriptionKk,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) => TopicModel(
        id: json['id'] as String,
        subjectId: json['subjectId'] as String,
        nameKk: json['nameKk'] as String,
        nameRu: json['nameRu'] as String,
        nameEn: json['nameEn'] as String,
        descriptionKk: json['descriptionKk'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'subjectId': subjectId,
        'nameKk': nameKk,
        'nameRu': nameRu,
        'nameEn': nameEn,
        'descriptionKk': descriptionKk,
      };

  String toJsonString() => jsonEncode(toJson());

  factory TopicModel.fromJsonString(String s) =>
      TopicModel.fromJson(jsonDecode(s) as Map<String, dynamic>);

  String localizedName(String lang) {
    switch (lang) {
      case 'ru':
        return nameRu;
      case 'en':
        return nameEn;
      default:
        return nameKk;
    }
  }
}
