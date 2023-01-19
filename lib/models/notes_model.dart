import 'package:flutter/cupertino.dart';
import 'package:notes_flutter/utils/common_methods.dart';

@immutable
class NoteModel {
  String? id;
  String title;
  String? subtitle;
  bool? edited;
  DateTime? dateTime;

  NoteModel({
    this.id,
    required this.title,
    this.subtitle = "",
    this.edited = false,
    this.dateTime,
  }) {
    id = getUniqueUid;
    dateTime = DateTime.now();
  }

  NoteModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'] ?? "",
        subtitle = json['subtitle'] ?? "",
        edited = json['edited'] ?? true,
        dateTime = json['dateTime'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'edited': edited,
        'dateTime': dateTime,
      };

  NoteModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    bool? edited,
    DateTime? dateTime,
  }) {
    var noteModel = NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      edited: edited ?? this.edited,
      dateTime: dateTime ?? this.dateTime,
    );
    return noteModel;
  }
}
