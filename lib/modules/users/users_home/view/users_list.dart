import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/common_components/custom_text_widget.dart';
import 'package:notes_flutter/modules/users/users_home/provider/user_provider.dart';
import 'package:notes_flutter/modules/users/users_home/view/user_detail.dart';

class UserList extends ConsumerWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listUsers = ref.watch(usersProvider);

    return listUsers.when(
      data: (data) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: listUsers.value!.length,
          itemBuilder: (context, index) {
            var element = listUsers.value![index];

            return ListTile(
              title: CustomTextWidget(
                text: element.name ?? "",
                fontSize: 20,
              ),
              subtitle: CustomTextWidget(
                text: element.email ?? "",
              ),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserDetail(
                            userModel: element,
                          )));
                },
              ),
              tileColor: index.isEven ? Colors.grey[200] : Colors.white,
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            );
          },
        );
      },
      error: (error, stackTrace) {
        return Center(
            child: CustomTextWidget(
          text: "$error",
        ));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
