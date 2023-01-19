import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/common_components/custom_text_widget.dart';
import 'package:notes_flutter/modules/users/users_home/provider/user_provider.dart';
import 'package:notes_flutter/modules/users/users_home/view/users_list.dart';

class UsersHomePage extends ConsumerWidget {
  const UsersHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listUsers = ref.watch(usersProvider);

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: listUsers.when(
            data: (data) {
              return UserList();
            },
            error: (error, stackTrace) {
              return Center(
                  child: CustomTextWidget(
                text: "${error}",
              ));
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
