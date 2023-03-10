import 'package:flutter/material.dart';

@immutable
class NoteModel {
  final String id;
  String title;
  String? subtitle;
  DateTime? dateTime;
  int? tileColorIndex;

  NoteModel({
    required this.id,
    required this.title,
    this.subtitle = "",
    this.dateTime,
    this.tileColorIndex = 0,
  }) {
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
    required String id,
    String? title,
    String? subtitle,
    DateTime? dateTime,
    int? tileColorIndex,
  }) {
    var noteModel = NoteModel(
      id: id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      dateTime: dateTime ?? this.dateTime,
      tileColorIndex: tileColorIndex ?? this.tileColorIndex,
    );
    return noteModel;
  }
}
