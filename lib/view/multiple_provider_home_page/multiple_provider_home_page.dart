import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/provider/multiple_provider/all_note_modifier_multiple_provider.dart';
import 'package:notes_flutter/provider/multiple_provider/deleted_note_modifier_multiple_provider.dart';
import 'package:notes_flutter/provider/multiple_provider/home_provider.dart';
import 'package:notes_flutter/utils/custom_text_widget.dart';
import 'package:notes_flutter/view/multiple_provider_home_page/all_notes/all_notes.dart';
import 'package:notes_flutter/view/multiple_provider_home_page/deleted_notes/deleted_notes.dart';

class MultipleProviderHomePage extends ConsumerWidget {
  const MultipleProviderHomePage({Key? key}) : super(key: key);

  toggleTab(
    WidgetRef ref,
    bool value,
  ) {
    ref.read(isAllSelectedMultipleProvider.notifier).state = value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAllSelected = ref.watch(isAllSelectedMultipleProvider);
    final deletedNotes = ref.watch(deletedNoteMultipleProvider);
    final futureNotes = ref.watch(futureNotesListsProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.refresh(allNoteMultipleProvider);
          ref.refresh(deletedNoteMultipleProvider);
          ref.refresh(futureNotesListsProvider);
        },
        child: const Icon(Icons.replay),
      ),
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

                      //ref.read(isAllSelectedMultipleProvider.notifier).state = value;
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
                  ? deletedNotes.length < 1
                      ? const SizedBox()
                      : ElevatedButton(
                          onPressed: () {
                            ref
                                .read(deletedNoteMultipleProvider.notifier)
                                .clearTrash();
                          },
                          child: CustomTextWidget(
                            text: "Delete All",
                            color: Colors.white,
                          ),
                        )
                  : const SizedBox(),
              // isAllSelected == true ? const AllNotes() : const DeletedNotes(),
              futureNotes.when(
                data: (data) {
                  return isAllSelected == true
                      ? const AllNotes()
                      : const DeletedNotes();
                },
                error: (error, stackTrace) {
                  return CustomTextWidget(text: error.toString());
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
