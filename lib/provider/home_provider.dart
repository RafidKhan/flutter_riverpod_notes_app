import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/model/data_model.dart';
import 'package:notes_flutter/provider/note_modifier.dart';

final noteListProvider =
    StateNotifierProvider<NoteNotifier, List<NoteModel>>((ref) {
  return NoteNotifier([
    for (int i = 0; i < 30; i++)
      NoteModel(
          id: i,
          title: "Title ${(i + 1)}",
          subtitle: "Sub-Title ${(i + 1)}",
          edited: false),
  ]);
});

final isAllSelectedProvider = StateProvider<bool>((ref) => true);
