import 'dart:convert';

class SubjectModel {
  final String id;
  final String nameKk;
  final String nameRu;
  final String nameEn;
  final String icon;
  final int order;

  const SubjectModel({
    required this.id,
    required this.nameKk,
    required this.nameRu,
    required this.nameEn,
    required this.icon,
    required this.order,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        id: json['id'] as String,
        nameKk: json['nameKk'] as String,
        nameRu: json['nameRu'] as String,
        nameEn: json['nameEn'] as String,
        icon: json['icon'] as String,
        order: json['order'] as int,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameKk': nameKk,
        'nameRu': nameRu,
        'nameEn': nameEn,
        'icon': icon,
        'order': order,
      };

  String toJsonString() => jsonEncode(toJson());

  factory SubjectModel.fromJsonString(String s) =>
      SubjectModel.fromJson(jsonDecode(s) as Map<String, dynamic>);

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
