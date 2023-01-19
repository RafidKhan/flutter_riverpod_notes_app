import 'package:flutter/material.dart';
import 'package:notes_flutter/common_components/custom_text_widget.dart';
import 'package:notes_flutter/modules/notes/notes_home/view/notes_home_page.dart';
import 'package:notes_flutter/modules/users/users_home/view/users_home_page.dart';

class DefaultHomePage extends StatelessWidget {
  const DefaultHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NotesHomePage()));
                  },
                  child: CustomTextWidget(
                    text: "Notes",
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UsersHomePage()));
                  },
                  child: CustomTextWidget(
                    text: "Users",
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
