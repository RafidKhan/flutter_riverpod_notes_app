import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/model/data_model.dart';
import 'package:notes_flutter/provider/notes_provider/all_note_modifier_provider.dart';
import 'package:notes_flutter/utils/commonMethods.dart';

final deletedNoteProvider =
    StateNotifierProvider<DeletedNoteNotifier, List<NoteModel>>((ref) {
  return DeletedNoteNotifier(ref);
});

class DeletedNoteNotifier extends StateNotifier<List<NoteModel>> {
  final Ref ref;

  DeletedNoteNotifier(this.ref) : super([]);

  void addNote({
    required NoteModel getNoteModel,
  }) {
    state = [
      for (final noteModel in state)
        if (noteModel.id != getNoteModel.id) noteModel,
      getNoteModel
    ];
  }

  void restoreNote({
    required NoteModel getNoteModel,
  }) {
    state = [
      for (final noteModel in state)
        if (noteModel.id != getNoteModel.id) noteModel,
    ];

    ref.read(allNoteProvider.notifier).addNote(getNoteModel: getNoteModel);
  }

  void removeFromTrash({
    required NoteModel getNoteModel,
  }) {
    state = [
      for (final noteModel in state)
        if (noteModel.id != getNoteModel.id) noteModel,
    ];
  }

  void clearTrash() {
    state = [];
  }
}
