import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/models/notes_model.dart';
import 'package:notes_flutter/modules/notes/all_notes/provider/all_note_modifier_provider.dart';
import 'package:notes_flutter/utils/common_methods.dart';
import 'package:notes_flutter/common_components/custom_text_widget.dart';

class NoteTile extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final tileColors = ref.watch(tileColorsProvider);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        color: tileColors[noteModel.tileColorIndex ?? 0],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: noteModel.title,
                    maxLines: 1,
                    fontSize: 20,
                  ),
                  CustomTextWidget(
                    text: noteModel.subtitle ?? "Subtitle",
                    maxLines: 1,
                    fontSize: 17,
                  ),
                  CustomTextWidget(
                    text:
                        getDateTimeFormattedValue(dateTime: noteModel.dateTime),
                    fontSize: 17,
                  ),
                ],
              ),
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
