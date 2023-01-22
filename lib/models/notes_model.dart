import 'package:flutter/cupertino.dart';
import 'package:notes_flutter/utils/common_methods.dart';

@immutable
class NoteModel {
  String? id;
  String title;
  String? subtitle;
  DateTime? dateTime;
  int? tileColorIndex;

  NoteModel({
    this.id,
    required this.title,
    this.subtitle = "",
    this.dateTime,
    this.tileColorIndex = 0,
  }) {
    id = getUniqueUid;
    dateTime = DateTime.now();
  }

  NoteModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'] ?? "",
        subtitle = json['subtitle'] ?? "",
        tileColorIndex = json['tileColorIndex'] ?? 0,
        dateTime = json['dateTime'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'dateTime': dateTime,
        'tileColorIndex': tileColorIndex,
      };

  NoteModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    DateTime? dateTime,
    int? tileColorIndex,
  }) {
    var noteModel = NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      dateTime: dateTime ?? this.dateTime,
      tileColorIndex: tileColorIndex ?? this.tileColorIndex,
    );
    return noteModel;
  }
}
