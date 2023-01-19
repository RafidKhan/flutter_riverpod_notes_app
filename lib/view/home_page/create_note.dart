import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/provider/notes_provider/all_note_modifier_provider.dart';
import 'package:notes_flutter/utils/custom_text_widget.dart';

class CreateNote extends ConsumerWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteModel = ref.read(createNoteProvider);

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
                      if (noteModel.title != null) {
                        if (noteModel.title!.isNotEmpty) {
                          noteModel.dateTime = DateTime.now();
                          ref
                              .read(allNoteProvider.notifier)
                              .addNote(getNoteModel: noteModel);
                          Navigator.pop(context);
                        }
                      }
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
