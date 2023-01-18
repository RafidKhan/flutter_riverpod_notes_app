import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/model/data_model.dart';

class NoteNotifier extends StateNotifier<List<NoteModel>> {
  NoteNotifier(super.state);

  void updateNote({required NoteModel getNoteModel}) {
    state = [
      for (final noteModel in state)
        if (noteModel.id == getNoteModel.id)
          noteModel.copyWith(
              id: getNoteModel.id,
              title: getNoteModel.title,
              subtitle: getNoteModel.subtitle,
              edited: getNoteModel.edited,
              exists: getNoteModel.exists)
        else
          noteModel,
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
          noteModel.copyWith(
              id: getNoteModel.id,
              title: getNoteModel.title,
              subtitle: getNoteModel.subtitle,
              edited: getNoteModel.edited,
              exists: false)
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
          noteModel.copyWith(
              id: getNoteModel.id,
              title: getNoteModel.title,
              subtitle: getNoteModel.subtitle,
              edited: getNoteModel.edited,
              exists: true)
        else
          noteModel,
    ];
  }

  void clearTrash() {
    for (int i = 0; i < state.length; i++) {
      if (state[i].exists == false) {
        state.removeAt(i);
      }
    }
    state = [for (final noteModel in state) noteModel];
  }
}
