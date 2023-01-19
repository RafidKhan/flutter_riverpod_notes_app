import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/model/notes_model.dart';
import 'package:notes_flutter/modules/all_notes/provider/all_note_modifier_provider.dart';

final editNoteProvider =
    StateNotifierProvider<EditNoteNotifier, NoteModel>((ref) {
  return EditNoteNotifier(ref);
});

class EditNoteNotifier extends StateNotifier<NoteModel> {
  final Ref ref;

  EditNoteNotifier(this.ref) : super(NoteModel(title: ""));

  void updateNote({
    required NoteModel getNoteModel,
  }) {
    state = getNoteModel;
    ref.read(allNoteProvider.notifier).updateNote(getNoteModel: getNoteModel);
  }

  void catchNote({
    required NoteModel getNoteModel,
  }) {
    state = getNoteModel;
  }
}
