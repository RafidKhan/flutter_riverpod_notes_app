import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/provider/note_modifier.dart';
import 'package:notes_flutter/utils/custom_text_widget.dart';
import 'package:notes_flutter/view/all_lists.dart';
import 'package:notes_flutter/view/deleted_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  toggleTab(WidgetRef ref, bool value) {
    ref.read(isAllSelectedProvider.notifier).update((state) => value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAllSelected = ref.watch(isAllSelectedProvider);
    ref.watch(noteListProvider);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      toggleTab(ref, true);
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      color: isAllSelected == true ? Colors.blue : Colors.grey,
                      child: Center(
                        child: CustomTextWidget(
                          text: "All",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      toggleTab(ref, false);
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      color: isAllSelected == false ? Colors.blue : Colors.grey,
                      child: Center(
                        child: CustomTextWidget(
                          text: "Trash",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              isAllSelected == false
                  ? ref.watch(noteListProvider.notifier).deletedNotesLength < 1
                      ? const SizedBox()
                      : ElevatedButton(
                          onPressed: () {
                            ref.read(noteListProvider.notifier).clearTrash();
                          },
                          child: CustomTextWidget(
                            text: "Delete All",
                            color: Colors.white,
                          ),
                        )
                  : const SizedBox(),
              isAllSelected == true ? const AllLists() : const DeletedLists(),
            ],
          ),
        ),
      ),
    );
  }
}
