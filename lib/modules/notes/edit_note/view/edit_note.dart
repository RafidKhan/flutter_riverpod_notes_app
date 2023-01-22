import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/common_components/custom_text_widget.dart';
import 'package:notes_flutter/modules/notes/all_notes/provider/all_note_modifier_provider.dart';
import 'package:notes_flutter/modules/notes/edit_note/provider/edit_note_modifier_provider.dart';
import 'package:notes_flutter/modules/notes/edit_note/view/setting_alert_dialog.dart';

class EditNote extends ConsumerWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editNoteModel = ref.watch(editNoteProvider);
    final noteCategory = ref.watch(noteCategoryProvider);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: noteCategory[editNoteModel.tileColorIndex ?? 0].color,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const SettingAlertDialog();
                        },
                      );
                    },
                    icon: const Icon(Icons.settings),
                  ),
                ),
                TextFormField(
                  initialValue: editNoteModel.title,
                  maxLength: 20,
                  onChanged: (value) {
                    editNoteModel.title = value;
                  },
                ),
                TextFormField(
                  initialValue: editNoteModel.subtitle ?? " Subtitle",
                  maxLength: 200,
                  maxLines: null,
                  onChanged: (value) {
                    editNoteModel.subtitle = value;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      ref.read(editNoteProvider.notifier).updateNote(
                            getNoteModel: editNoteModel,
                            context: context,
                          );
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
