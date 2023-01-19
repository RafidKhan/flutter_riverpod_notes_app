import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/model/data_model.dart';
import 'package:notes_flutter/provider/notes_provider/all_note_modifier_provider.dart';
import 'package:notes_flutter/utils/commonMethods.dart';

final isAllSelectedProvider = StateProvider<bool>((ref) => true);

final futureNotesListsProvider = FutureProvider<List<NoteModel>>((ref) async {
  List<NoteModel> notesList = <NoteModel>[];

  await Future.delayed(const Duration(seconds: 10));

  for (int i = 0; i < 10; i++) {
    notesList.add(NoteModel(
      id: getUniqueUid,
      title: "Title-${(i + 1)}",
      subtitle: "Subtitle-${(i + 1)}",
      dateTime: DateTime.now(),
    ));
  }

  notesList.forEach((element) {
    ref.read(allNoteProvider.notifier).addNote(getNoteModel: element);
  });

  return notesList;
});
