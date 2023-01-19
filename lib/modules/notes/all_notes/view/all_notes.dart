import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/common_components/note_tile.dart';
import 'package:notes_flutter/modules/notes/all_notes/provider/all_note_modifier_provider.dart';
import 'package:notes_flutter/modules/notes/edit_note/provider/edit_note_modifier_provider.dart';
import 'package:notes_flutter/modules/notes/edit_note/view/edit_note.dart';

class AllNotes extends ConsumerWidget {
  const AllNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesData = ref.watch(allNoteProvider);
    notesData.sort((a, b) => b.dateTime!.compareTo(a.dateTime!));

    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: notesData.length,
        itemBuilder: (context, index) {
          var element = notesData[index];
          return NoteTile(
            noteModel: element,
            onTap: () {
              ref.read(editNoteProvider.notifier).state = element;
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const EditNote()));
            },
            onDelete: () {
              ref
                  .read(allNoteProvider.notifier)
                  .moveToTrash(getNoteModel: element);
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
