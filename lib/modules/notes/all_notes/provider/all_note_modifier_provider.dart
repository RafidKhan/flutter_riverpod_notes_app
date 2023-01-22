import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/models/category_model.dart';
import 'package:notes_flutter/models/notes_model.dart';
import 'package:notes_flutter/modules/notes/deleted_notes/provider/deleted_note_provider.dart';

final noteCategoryProvider = Provider<List<CategoryModel>>((ref) {
  return [
    CategoryModel(
      color: Colors.white,
      categoryName: "default",
    ),
    CategoryModel(
      color: Colors.grey[300] ?? Colors.grey,
      categoryName: "music",
    ),
    CategoryModel(
      color: Colors.amber,
      categoryName: "story",
    ),
    CategoryModel(
      color: Colors.grey,
      categoryName: "grocery",
    ),
    CategoryModel(
      color: Colors.greenAccent,
      categoryName: "study",
    ),
    CategoryModel(
      color: Colors.lightBlueAccent,
      categoryName: "office",
    ),
    CategoryModel(
      color: Colors.purpleAccent,
      categoryName: "meeting",
    ),
  ];
});

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
    state = [for (final noteModel in state) noteModel, getNoteModel];
  }

  void updateNote({
    required NoteModel getNoteModel,
  }) {
    for (int i = 0; i < state.length; i++) {
      if (state[i].id == getNoteModel.id) {
        state[i] = getNoteModel;
        break;
      }
    }
    state = [for (final noteModel in state) noteModel];
  }
}
