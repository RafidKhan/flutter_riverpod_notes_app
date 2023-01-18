import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/provider/multiple_provider/all_note_modifier_multiple_provider.dart';
import 'package:notes_flutter/utils/custom_text_widget.dart';
import 'package:notes_flutter/view/single_provider_view/edit_note.dart';

class AllNotes extends ConsumerWidget {
  const AllNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesData = ref.watch(allNoteMultipleProvider);
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
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[900],
                ),
                onPressed: () {
                  ref
                      .read(allNoteMultipleProvider.notifier)
                      .moveToTrash(getNoteModel: element);
                },
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditNote(
                          noteModel: element,
                        )));
              },
            );
          }),
    );
  }
}
