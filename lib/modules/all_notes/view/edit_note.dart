import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/model/notes_model.dart';
import 'package:notes_flutter/modules/all_notes/provider/all_note_modifier_provider.dart';
import 'package:notes_flutter/common_components/custom_text_widget.dart';

class EditNote extends ConsumerWidget {
  NoteModel noteModel;

  EditNote({Key? key, required this.noteModel})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  maxLength: 20,
                  initialValue: noteModel.title,
                  onChanged: (value) {
                    noteModel.title = value;
                  },
                ),
                TextFormField(
                  initialValue: noteModel.subtitle,
                  maxLength: 200,
                  maxLines: null,
                  onChanged: (value) {
                    noteModel.subtitle = value;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      noteModel.edited = true;
                      noteModel.dateTime = DateTime.now();

                      ref
                          .read(allNoteProvider.notifier)
                          .updateNote(getNoteModel: noteModel);
                      Navigator.pop(context);
                    },
                    child: CustomTextWidget(
                      text: "Save",
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
