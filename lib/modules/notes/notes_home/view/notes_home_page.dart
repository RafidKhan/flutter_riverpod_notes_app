import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/common_components/custom_text_widget.dart';
import 'package:notes_flutter/modules/notes/all_notes/provider/all_note_modifier_provider.dart';
import 'package:notes_flutter/modules/notes/all_notes/view/all_notes.dart';
import 'package:notes_flutter/modules/notes/create_note/view/create_note.dart';
import 'package:notes_flutter/modules/notes/deleted_notes/provider/deleted_note_provider.dart';
import 'package:notes_flutter/modules/notes/deleted_notes/view/deleted_notes.dart';
import 'package:notes_flutter/modules/notes/notes_home/provider/home_provider.dart';
import 'package:notes_flutter/modules/notes/notes_home/view/category_filter_alert.dart';

class NotesHomePage extends ConsumerWidget {
  const NotesHomePage({Key? key}) : super(key: key);

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
    final noteCategory = ref.watch(noteCategoryProvider);

    return Scaffold(
      floatingActionButton: isAllSelected == true
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateNote()));
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
              futureNotes.when(
                data: (data) {
                  return isAllSelected == false
                      ? deletedNotes.isEmpty
                          ? const SizedBox()
                          : ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(deletedNoteProvider.notifier)
                                    .clearTrash();
                              },
                              child: CustomTextWidget(
                                text: "Delete All",
                                color: Colors.white,
                              ),
                            )
                      : noteCategory.isEmpty
                          ? const SizedBox()
                          : IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const CategoryFilterAlertDialog();
                                  },
                                );
                              },
                              icon: const Icon(Icons.filter_list_sharp),
                            );
                },
                error: (error, stackTrace) {
                  return CustomTextWidget(text: error.toString());
                },
                loading: () {
                  return const SizedBox();
                },
              ),

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
