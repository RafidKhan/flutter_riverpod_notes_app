import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/modules/deleted_notes/provider/deleted_note_provider.dart';
import 'package:notes_flutter/modules/home/provider/home_provider.dart';
import 'package:notes_flutter/common_components/custom_text_widget.dart';
import 'package:notes_flutter/modules/all_notes/view/all_notes.dart';
import 'package:notes_flutter/modules/create_note/view/create_note.dart';
import 'package:notes_flutter/modules/deleted_notes/view/deleted_notes.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  toggleTab(
    WidgetRef ref,
    bool value,
  ) {
    ref.read(isAllSelectedProvider.notifier).state = value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAllSelected = ref.watch(isAllSelectedProvider);
    final deletedNotes = ref.watch(deletedNoteProvider);
    final futureNotes = ref.watch(futureNotesListsProvider);
    return Scaffold(
      floatingActionButton: isAllSelected == true
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreateNote()));
              },
              child: const Icon(Icons.add),
            )
          : const SizedBox(),
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
                  ? deletedNotes.isEmpty
                      ? const SizedBox()
                      : ElevatedButton(
                          onPressed: () {
                            ref.read(deletedNoteProvider.notifier).clearTrash();
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
