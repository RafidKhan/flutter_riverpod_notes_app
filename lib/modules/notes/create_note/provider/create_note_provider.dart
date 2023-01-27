import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/models/category_model.dart';
import 'package:notes_flutter/models/notes_model.dart';
import 'package:notes_flutter/modules/notes/all_notes/provider/all_note_modifier_provider.dart';

final tileColorProvider = StateProvider<int>((ref) => 0);

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

final createNoteProvider =
    StateNotifierProvider.autoDispose<CreateNoteNotifier, NoteModel>((ref) {
  return CreateNoteNotifier(ref);
});

class CreateNoteNotifier extends StateNotifier<NoteModel> {
  final Ref ref;

  CreateNoteNotifier(this.ref) : super(NoteModel(id: "", title: ""));

  void createNote({
    required NoteModel getNoteModel,
  }) {
    state = getNoteModel;
    ref.read(allNoteProvider.notifier).addNote(getNoteModel: getNoteModel);
  }

  void catchNote({
    required NoteModel getNoteModel,
  }) {
    state = getNoteModel;
  }
}
