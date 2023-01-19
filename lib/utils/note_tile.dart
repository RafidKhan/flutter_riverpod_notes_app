import 'package:flutter/material.dart';
import 'package:notes_flutter/model/data_model.dart';
import 'package:notes_flutter/utils/commonMethods.dart';
import 'package:notes_flutter/utils/custom_text_widget.dart';

class NoteTile extends StatelessWidget {
  NoteModel noteModel;
  VoidCallback onDelete;
  VoidCallback onTap;

  NoteTile({
    Key? key,
    required this.noteModel,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        color: noteModel.edited == false ? Colors.grey[200] : Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: noteModel.title ?? "Title",
                  maxLines: 1,
                  fontSize: 20,
                ),
                CustomTextWidget(
                  text: noteModel.subtitle ?? "Subtitle",
                  maxLines: 1,
                  fontSize: 17,
                ),
                CustomTextWidget(
                  text: getDateTimeFormattedValue(dateTime: noteModel.dateTime),
                  maxLines: 1,
                  fontSize: 17,
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red[900],
              ),
              onPressed: onDelete,
            )
          ],
        ),
      ),
    );
  }
}
