import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/models/notes_model.dart';
import 'package:notes_flutter/modules/notes/all_notes/provider/all_note_modifier_provider.dart';
import 'package:notes_flutter/utils/common_methods.dart';
import 'package:notes_flutter/common_components/custom_text_widget.dart';

class DeletedNoteTile extends ConsumerWidget {
  NoteModel noteModel;
  VoidCallback onPermanentDelete;
  VoidCallback onRestore;

  DeletedNoteTile({
    Key? key,
    required this.noteModel,
    required this.onRestore,
    required this.onPermanentDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tileColors = ref.watch(noteCategoryProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      color: tileColors[noteModel.tileColorIndex ?? 0].color,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: noteModel.title,
                  maxLines: 1,
                  fontSize: 17,
                ),
                CustomTextWidget(
                  text: noteModel.subtitle ?? "Subtitle",
                  maxLines: 1,
                  fontSize: 17,
                ),
                CustomTextWidget(
                  text: getDateTimeFormattedValue(dateTime: noteModel.dateTime),
                  fontSize: 17,
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: onRestore,
          ),
          IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red[900],
            ),
            onPressed: onPermanentDelete,
          ),
        ],
      ),

      // title:
      // subtitle:
      // trailing: Row(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     IconButton(
      //       icon: const Icon(Icons.undo),
      //       onPressed: () {
      //         ref
      //             .read(noteListSingleProvider.notifier)
      //             .removeFromTrash(getNoteModel: noteModel);
      //       },
      //     ),
      //     IconButton(
      //       icon: Icon(
      //         Icons.delete_forever,
      //         color: Colors.red[900],
      //       ),
      //       onPressed: () {
      //         ref
      //             .read(noteListSingleProvider.notifier)
      //             .deleteNote(getNoteModel: noteModel);
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}
