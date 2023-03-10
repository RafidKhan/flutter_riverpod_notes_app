import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/common_components/deleted_note_tile.dart';
import 'package:notes_flutter/modules/notes/deleted_notes/provider/deleted_note_provider.dart';

class DeletedNotes extends ConsumerWidget {
  const DeletedNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesData = ref.watch(deletedNoteProvider);
    notesData.sort((a, b) => b.dateTime!.compareTo(a.dateTime!));

    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: notesData.length,
        itemBuilder: (context, index) {
          var element = notesData[index];

          return DeletedNoteTile(
            noteModel: element,
            onRestore: () {
              ref
                  .read(deletedNoteProvider.notifier)
                  .restoreNote(getNoteModel: element);
            },
            onPermanentDelete: () {
              ref
                  .read(deletedNoteProvider.notifier)
                  .removeFromTrash(getNoteModel: element);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
          );
        },
      ),
    );
  }
}
