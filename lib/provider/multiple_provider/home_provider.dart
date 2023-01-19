import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/model/data_model.dart';
import 'package:notes_flutter/provider/multiple_provider/all_note_modifier_multiple_provider.dart';

final isAllSelectedMultipleProvider = StateProvider<bool>((ref) => true);

final futureNotesListsProvider = FutureProvider<List<NoteModel>>((ref) async {
  List<NoteModel> notesList = <NoteModel>[];

  await Future.delayed(const Duration(seconds: 10));

  for (int i = 0; i < 10; i++) {
    notesList.add(NoteModel(
      id: i,
      title: "Title-${(i + 1)}",
      subtitle: "Subtitle-${(i + 1)}",
      dateTime: DateTime.now(),
    ));
  }

  notesList.forEach((element) {
    ref.read(allNoteMultipleProvider.notifier).addNote(getNoteModel: element);
  });

  return notesList;
});
