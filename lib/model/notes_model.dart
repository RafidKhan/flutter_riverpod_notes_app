import 'package:flutter/cupertino.dart';

@immutable
class NoteModel {
  String? id;
  String? title;
  String? subtitle;
  bool? edited;
  bool? exists;
  DateTime? dateTime;

  NoteModel({
    this.id,
    this.title = "",
    this.subtitle = "",
    this.edited = false,
    this.exists = true,
    this.dateTime,
  });

  NoteModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'] ?? "",
        subtitle = json['subtitle'] ?? "",
        edited = json['edited'] ?? true,
        dateTime = json['dateTime'],
        exists = json['exists'] ?? true;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'edited': edited,
        'exists': exists,
        'dateTime': dateTime,
      };

  NoteModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    bool? edited,
    bool? exists,
    DateTime? dateTime,
  }) {
    var noteModel = NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      edited: edited ?? this.edited,
      exists: exists ?? this.exists,
      dateTime: dateTime ?? this.dateTime,
    );
    return noteModel;
  }
}
