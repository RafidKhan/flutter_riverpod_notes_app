import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/provider/single_provider/note_modifier.dart';
import 'package:notes_flutter/utils/deleted_note_tile.dart';

class DeletedLists extends ConsumerWidget {
  const DeletedLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesData = ref.watch(noteListSingleProvider);
    notesData.sort((a, b) => b.dateTime!.compareTo(a.dateTime!));

    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: notesData.length,
          itemBuilder: (context, index) {
            var element = notesData[index];
            if (element.exists == true) {
              return const SizedBox();
            } else {
              return DeletedNoteTile(
                noteModel: element,
                onRestore: () {
                  ref
                      .read(noteListSingleProvider.notifier)
                      .removeFromTrash(getNoteModel: element);
                },
                onPermanentDelete: () {
                  ref
                      .read(noteListSingleProvider.notifier)
                      .deleteNote(getNoteModel: element);
                },
              );
            }
          }),
    );
  }
}
