import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/provider/multiple_provider/all_note_modifier_multiple_provider.dart';
import 'package:notes_flutter/utils/custom_text_widget.dart';
import 'package:notes_flutter/utils/note_tile.dart';
import 'package:notes_flutter/view/multiple_provider_home_page/edit_note_multiple_provider.dart';
import 'package:notes_flutter/view/single_provider_view/edit_note.dart';

class AllNotes extends ConsumerWidget {
  const AllNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesData = ref.watch(allNoteMultipleProvider);
    notesData.sort((a, b) => b.dateTime!.compareTo(a.dateTime!));

    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: notesData.length,
          itemBuilder: (context, index) {
            var element = notesData[index];
            return NoteTile(
              noteModel: element,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditNoteMultipleProviderPage(
                          noteModel: element,
                        )));
              },
              onDelete: () {
                ref
                    .read(allNoteMultipleProvider.notifier)
                    .moveToTrash(getNoteModel: element);
              },
            );
          }),
    );
  }
}
