import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/model/data_model.dart';

final noteListSingleProvider =
    StateNotifierProvider<NoteNotifier, List<NoteModel>>((ref) {
  return NoteNotifier([]);
});

final isAllSelectedSingleProvider = StateProvider<bool>((ref) => true);

class NoteNotifier extends StateNotifier<List<NoteModel>> {
  NoteNotifier(super.state);

  void updateNote({required NoteModel getNoteModel}) {
    state = [
      for (final noteModel in state) noteModel,
    ];
  }

  void deleteNote({
    required NoteModel getNoteModel,
  }) {
    for (int i = 0; i < state.length; i++) {
      if (state[i].id == getNoteModel.id) {
        state.removeAt(i);
      }
    }
    state = [
      for (final noteModel in state) noteModel,
    ];
  }

  void moveToTrash({
    required NoteModel getNoteModel,
  }) {
    state = [
      for (final noteModel in state)
        if (noteModel.id == getNoteModel.id)
          noteModel.copyWith(exists: false)
        else
          noteModel,
    ];
  }

  void removeFromTrash({
    required NoteModel getNoteModel,
  }) {
    state = [
      for (final noteModel in state)
        if (noteModel.id == getNoteModel.id)
          noteModel.copyWith(exists: true)
        else
          noteModel,
    ];
  }

  void clearTrash() {
    state = [
      for (final noteModel in state)
        if (noteModel.exists == true)
          noteModel.copyWith(
              id: noteModel.id,
              title: noteModel.title,
              subtitle: noteModel.subtitle,
              edited: noteModel.edited,
              exists: true)
    ];
  }

  int get deletedNotesLength {
    int result = 0;
    List<NoteModel> deletedNotesList = state.where((i) => !i.exists!).toList();
    result = deletedNotesList.length;
    return result;
  }
}
