// To parse this JSON data, do
//
//     final studenDataModel = studenDataModelFromJson(jsonString);

import 'dart:convert';

List<StudenDataModel> studenDataModelFromJson(String str) => List<StudenDataModel>.from(json.decode(str).map((x) => StudenDataModel.fromJson(x)));

String studenDataModelToJson(List<StudenDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudenDataModel {
  int? id;
  String? name;
  List<Score>? scores;

  StudenDataModel({
    this.id,
    this.name,
    this.scores,
  });

  factory StudenDataModel.fromJson(Map<String, dynamic> json) => StudenDataModel(
    id: json["_id"],
    name: json["name"],
    scores: json["scores"] == null ? [] : List<Score>.from(json["scores"]!.map((x) => Score.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "scores": scores == null ? [] : List<dynamic>.from(scores!.map((x) => x.toJson())),
  };
}

class Score {
  double? score;
  Type? type;

  Score({
    this.score,
    this.type,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    score: json["score"]?.toDouble(),
    type: typeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "score": score,
    "type": typeValues.reverse[type],
  };
}

enum Type {
  EXAM,
  HOMEWORK,
  QUIZ
}

final typeValues = EnumValues({
  "exam": Type.EXAM,
  "homework": Type.HOMEWORK,
  "quiz": Type.QUIZ
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
