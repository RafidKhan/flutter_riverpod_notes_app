import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/model/data_model.dart';
import 'package:notes_flutter/provider/home_provider.dart';
import 'package:notes_flutter/utils/custom_text_widget.dart';

class EditNote extends ConsumerWidget {
  NoteModel noteModel;

  EditNote({Key? key, required this.noteModel}) : super(key: key);
  String title = "";
  String subTitle = "";

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
                  onChanged: (value){
                    title = value;
                  },
                ),
                TextFormField(
                  initialValue: noteModel.subtitle,
                  maxLength: 200,
                  maxLines: null,
                  onChanged: (value){
                    subTitle = value;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if(title.isEmpty){
                        title = noteModel.title;
                      }
                      if(subTitle.isEmpty){
                        subTitle = noteModel.subtitle;
                      }
                      noteModel.title = title.trim();
                      noteModel.subtitle = subTitle.trim();
                      noteModel.edited = true;

                      ref
                          .read(noteListProvider.notifier)
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
