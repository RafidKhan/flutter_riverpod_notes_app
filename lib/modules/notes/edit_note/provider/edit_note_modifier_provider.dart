import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/models/edit_note_model.dart';
import 'package:notes_flutter/models/notes_model.dart';
import 'package:notes_flutter/modules/notes/all_notes/provider/all_note_modifier_provider.dart';

final editNoteProvider =
    StateNotifierProvider<EditNoteNotifier, EditNoteModel>((ref) {
  return EditNoteNotifier(ref);
});

final tileColorProvider = StateProvider<int>((ref) => 0);

class EditNoteNotifier extends StateNotifier<EditNoteModel> {
  final Ref ref;

  EditNoteNotifier(this.ref) : super(EditNoteModel(id: "", title: ""));

  void setNote({
    required EditNoteModel getNoteModel,
  }) {
    state = getNoteModel;
  }

  void updateNote({
    required EditNoteModel getNoteModel,
    required BuildContext context,
  }) {
    state.dateTime = DateTime.now();
    state = state.copyWith(
      id: getNoteModel.id,
      title: getNoteModel.title,
      subtitle: getNoteModel.subtitle,
      dateTime: getNoteModel.dateTime,
      tileColorIndex: getNoteModel.tileColorIndex,
    );

    var noteModel = NoteModel(id: "",title: "");
    noteModel = noteModel.copyWith(
      id: getNoteModel.id,
      title: getNoteModel.title,
      subtitle: getNoteModel.subtitle,
      dateTime: getNoteModel.dateTime,
      tileColorIndex: getNoteModel.tileColorIndex
    );
    ref.read(allNoteProvider.notifier).updateNote(
          getNoteModel: noteModel,
        );
    Navigator.pop(context);
  }
}
