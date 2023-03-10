import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/common_components/custom_text_widget.dart';
import 'package:notes_flutter/modules/notes/all_notes/provider/all_note_modifier_provider.dart';
import 'package:notes_flutter/modules/notes/edit_note/provider/edit_note_modifier_provider.dart';

class SettingAlertDialog extends ConsumerWidget {
  const SettingAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteCategory = ref.watch(noteCategoryProvider);
    final noteModel = ref.watch(editNoteProvider);
    final selectedTileColor = ref.watch(tileColorProvider);

    return AlertDialog(
      title: CustomTextWidget(
        text: "Select Category",
        fontSize: 20,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: noteCategory.length,
                itemBuilder: (context, index) {
                  var color = noteCategory[index].color;
                  var categoryName = noteCategory[index].categoryName;
                  return InkWell(
                    onTap: () {
                      ref.read(tileColorProvider.notifier).state = index;
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          index == selectedTileColor
                              ? const Icon(
                                  Icons.done,
                                  size: 30,
                                )
                              : const SizedBox(
                                  height: 30,
                                  width: 30,
                                ),
                          Container(
                            height: 30,
                            width: 30,
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                                color: color,
                                border: Border.all(color: Colors.black)),
                          ),
                          CustomTextWidget(
                            text: categoryName,
                            fontSize: 20,
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: CustomTextWidget(
            text: "OK",
            fontSize: 20,
            color: Colors.blue,
          ),
          onPressed: () {
            noteModel.tileColorIndex = selectedTileColor;
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
