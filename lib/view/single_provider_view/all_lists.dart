import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/provider/single_provider/note_modifier.dart';
import 'package:notes_flutter/utils/custom_text_widget.dart';
import 'package:notes_flutter/utils/note_tile.dart';
import 'package:notes_flutter/view/single_provider_view/edit_note.dart';

class AllLists extends ConsumerWidget {
  const AllLists({Key? key}) : super(key: key);

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
              return NoteTile(
                noteModel: element,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditNote(
                            noteModel: element,
                          )));
                },
                onDelete: () {
                  ref
                      .read(noteListSingleProvider.notifier)
                      .moveToTrash(getNoteModel: element);
                },
              );
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
