import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/models/notes_model.dart';
import 'package:notes_flutter/modules/notes/all_notes/provider/all_note_modifier_provider.dart';

final editNoteProvider =
    StateNotifierProvider<EditNoteNotifier, NoteModel>((ref) {
  return EditNoteNotifier(ref);
});

final tileColorProvider = StateProvider<int>((ref) => 0);

class EditNoteNotifier extends StateNotifier<NoteModel> {
  final Ref ref;

  EditNoteNotifier(this.ref) : super(NoteModel(title: ""));

  void updateNote({
    required NoteModel getNoteModel,
    required BuildContext context,
  }) {
    state.dateTime = DateTime.now();
    state = getNoteModel;
    ref.read(allNoteProvider.notifier).updateNote(getNoteModel: getNoteModel);
    Navigator.pop(context);
  }

  int getTileColor() {
    int result = 0;
    if (state.tileColorIndex == null) {
      result = 0;
    } else {
      result = state.tileColorIndex!;
    }
    return result;
  }
}
