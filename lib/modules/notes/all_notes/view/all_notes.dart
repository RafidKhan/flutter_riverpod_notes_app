import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/common_components/note_tile.dart';
import 'package:notes_flutter/models/edit_note_model.dart';
import 'package:notes_flutter/models/notes_model.dart';
import 'package:notes_flutter/modules/notes/all_notes/provider/all_note_modifier_provider.dart';
import 'package:notes_flutter/modules/notes/edit_note/provider/edit_note_modifier_provider.dart';
import 'package:notes_flutter/modules/notes/edit_note/view/edit_note.dart';
import 'package:notes_flutter/modules/notes/notes_home/provider/home_provider.dart';

class AllNotes extends ConsumerWidget {
  const AllNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesData = ref.watch(allNoteProvider);
    notesData.sort((a, b) => b.dateTime!.compareTo(a.dateTime!));
    final isAllSelected = ref.watch(categoryAllSelectedProvider);
    final selectedCategoryIndex = ref.watch(tileCategoryFilterProvider);

    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: notesData.length,
        itemBuilder: (context, index) {
          var element = notesData[index];

          if (isAllSelected == true) {
            return NoteTile(
              noteModel: element,
              onTap: () {
                ref.read(editNoteProvider.notifier).setNote(
                      getNoteModel: EditNoteModel(
                        id: element.id,
                        title: element.title,
                        subtitle: element.subtitle,
                        dateTime: element.dateTime,
                        tileColorIndex: element.tileColorIndex,
                      ),
                    );
                ref.read(tileColorProvider.notifier).state =
                    element.tileColorIndex ?? 0;
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const EditNote()));
              },
              onDelete: () {
                ref
                    .read(allNoteProvider.notifier)
                    .moveToTrash(getNoteModel: element);
              },
            );
          } else {
            if (selectedCategoryIndex == element.tileColorIndex) {
              return NoteTile(
                noteModel: element,
                onTap: () {
                  ref.read(editNoteProvider.notifier).setNote(
                        getNoteModel: EditNoteModel(
                          id: element.id,
                          title: element.title,
                          subtitle: element.subtitle,
                          dateTime: element.dateTime,
                          tileColorIndex: element.tileColorIndex,
                        ),
                      );
                  ref.read(tileColorProvider.notifier).state =
                      element.tileColorIndex ?? 0;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditNote()));
                },
                onDelete: () {
                  ref
                      .read(allNoteProvider.notifier)
                      .moveToTrash(getNoteModel: element);
                },
              );
            } else {
              return const SizedBox();
            }
          }
        },
      ),
    );
  }
}
