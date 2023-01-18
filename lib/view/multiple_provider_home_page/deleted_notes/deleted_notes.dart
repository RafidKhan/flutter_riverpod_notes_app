import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/provider/multiple_provider/deleted_note_modifier_multiple_provider.dart';
import 'package:notes_flutter/utils/custom_text_widget.dart';

class DeletedNotes extends ConsumerWidget {
  const DeletedNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesData = ref.watch(deletedNoteMultipleProvider);
    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: notesData.length,
          itemBuilder: (context, index) {
            var element = notesData[index];
            return ListTile(
              tileColor:
                  element.edited == false ? Colors.grey[200] : Colors.grey[300],
              title: CustomTextWidget(
                text: element.title ?? "Title",
                maxLines: 1,
                fontSize: 20,
              ),
              subtitle: CustomTextWidget(
                text: element.subtitle ?? "Subtitle",
                maxLines: 1,
                fontSize: 17,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.undo),
                    onPressed: () {
                      ref
                          .read(deletedNoteMultipleProvider.notifier)
                          .restoreNote(getNoteModel: element);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete_forever,
                      color: Colors.red[900],
                    ),
                    onPressed: () {
                      ref
                          .read(deletedNoteMultipleProvider.notifier)
                          .removeFromTrash(getNoteModel: element);
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
