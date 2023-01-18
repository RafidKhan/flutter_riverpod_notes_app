import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/provider/home_provider.dart';
import 'package:notes_flutter/utils/custom_text_widget.dart';

class DeletedLists extends ConsumerWidget {
  const DeletedLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesData = ref.watch(noteListProvider);
    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: notesData.length,
          itemBuilder: (context, index) {
            var element = notesData[index];
            if (element.exists == true) {
              return const SizedBox();
            } else {
              return ListTile(
                tileColor: element.edited == false
                    ? Colors.grey[200]
                    : Colors.grey[300],
                title: CustomTextWidget(
                  text: element.title,
                  maxLines: 1,
                  fontSize: 20,
                ),
                subtitle: CustomTextWidget(
                  text: element.subtitle,
                  maxLines: 1,
                  fontSize: 17,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.undo),
                      onPressed: () {
                        ref
                            .read(noteListProvider.notifier)
                            .removeFromTrash(getNoteModel: element);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.red[900],
                      ),
                      onPressed: () {
                        ref
                            .read(noteListProvider.notifier)
                            .deleteNote(getNoteModel: element);
                      },
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
