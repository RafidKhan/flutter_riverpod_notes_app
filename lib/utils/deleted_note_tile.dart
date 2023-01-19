import 'package:flutter/material.dart';
import 'package:notes_flutter/model/data_model.dart';
import 'package:notes_flutter/utils/commonMethods.dart';
import 'package:notes_flutter/utils/custom_text_widget.dart';

class DeletedNoteTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      color: noteModel.edited == false ? Colors.grey[200] : Colors.grey[300],
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                 text: noteModel.title ?? "Title",
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
