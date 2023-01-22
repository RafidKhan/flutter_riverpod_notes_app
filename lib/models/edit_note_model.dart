import 'package:flutter/material.dart';

@immutable
class EditNoteModel {
  final String id;
  String title;
  String? subtitle;
  DateTime? dateTime;
  int? tileColorIndex;

  EditNoteModel({
    required this.id,
    required this.title,
    this.subtitle = "",
    this.dateTime,
    this.tileColorIndex = 0,
  }) {
    dateTime = DateTime.now();
  }

  EditNoteModel copyWith({
    required String id,
    String? title,
    String? subtitle,
    DateTime? dateTime,
    int? tileColorIndex,
  }) {
    var editNoteModel = EditNoteModel(
      id: id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      dateTime: dateTime ?? this.dateTime,
      tileColorIndex: tileColorIndex ?? this.tileColorIndex,
    );
    return editNoteModel;
  }
}
