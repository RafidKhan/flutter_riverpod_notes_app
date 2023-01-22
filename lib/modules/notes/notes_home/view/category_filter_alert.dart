import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/common_components/custom_text_widget.dart';
import 'package:notes_flutter/modules/notes/all_notes/provider/all_note_modifier_provider.dart';
import 'package:notes_flutter/modules/notes/notes_home/provider/home_provider.dart';

class CategoryFilterAlertDialog extends ConsumerWidget {
  const CategoryFilterAlertDialog({Key? key}) : super(key: key);

  toggleFilter(bool value, WidgetRef ref) {
    ref.read(categoryAllSelectedProvider.notifier).state = value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteCategory = ref.watch(noteCategoryProvider);
    final selectedTileColor = ref.watch(tileCategoryFilterProvider);
    final isAllSelected = ref.watch(categoryAllSelectedProvider);

    return AlertDialog(
      title: CustomTextWidget(
        text: "Select Filter",
        fontSize: 20,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: noteCategory.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return InkWell(
                      onTap: () {
                        toggleFilter(true, ref);
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            isAllSelected == true
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(color: Colors.black)),
                            ),
                            CustomTextWidget(
                              text: "All",
                              fontSize: 20,
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    int finalIndex = index - 1;
                    var color = noteCategory[finalIndex].color;
                    var categoryName = noteCategory[finalIndex].categoryName;
                    return InkWell(
                      onTap: () {
                        toggleFilter(false, ref);
                        ref.read(tileCategoryFilterProvider.notifier).state =
                            finalIndex;
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            isAllSelected == false
                                ? finalIndex == selectedTileColor
                                    ? const Icon(
                                        Icons.done,
                                        size: 30,
                                      )
                                    : const SizedBox(
                                        height: 30,
                                        width: 30,
                                      )
                                : const SizedBox(
                                    height: 30,
                                    width: 30,
                                  ),
                            Container(
                              height: 30,
                              width: 30,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
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
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
