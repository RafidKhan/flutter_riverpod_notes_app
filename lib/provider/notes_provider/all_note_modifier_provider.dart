import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/model/data_model.dart';
import 'package:notes_flutter/provider/notes_provider/deleted_note_provider.dart';
import 'package:notes_flutter/utils/commonMethods.dart';

final createNoteProvider = StateProvider((ref) => NoteModel());

final allNoteProvider =
    StateNotifierProvider<AllNoteNotifier, List<NoteModel>>((ref) {
  return AllNoteNotifier(ref);
});

class AllNoteNotifier extends StateNotifier<List<NoteModel>> {
  final Ref ref;

  AllNoteNotifier(this.ref) : super([]);

  void moveToTrash({
    required NoteModel getNoteModel,
  }) {
    state = [
      for (final noteModel in state)
        if (noteModel.id != getNoteModel.id) noteModel
    ];

    ref.read(deletedNoteProvider.notifier).addNote(getNoteModel: getNoteModel);
  }

  void addNote({
    required NoteModel getNoteModel,
  }) {
    if (getNoteModel.id != null) {
      getNoteModel.id = getUniqueUid;
    }
    state = [for (final noteModel in state) noteModel, getNoteModel];
  }

  void updateNote({
    required NoteModel getNoteModel,
  }) {
    state = [for (final noteModel in state) noteModel];
  }
}
