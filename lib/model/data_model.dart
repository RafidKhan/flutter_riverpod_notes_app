import 'package:flutter/cupertino.dart';

@immutable
class NoteModel {
  int? id;
  String? title;
  String? subtitle;
  bool? edited;
  bool? exists;

  NoteModel({
    this.id,
    this.title = "",
    this.subtitle = "",
    this.edited = false,
    this.exists = true,
  });

  NoteModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'] ?? "",
        subtitle = json['subtitle'] ?? "",
        edited = json['edited'] ?? true,
        exists = json['exists'] ?? true;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'edited': edited,
        'exists': exists,
      };

  NoteModel copyWith({
    int? id,
    String? title,
    String? subtitle,
    bool? edited,
    bool? exists,
  }) {
    var noteModel = NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      edited: edited ?? this.edited,
      exists: exists ?? this.exists,
    );
    return noteModel;
  }
}
