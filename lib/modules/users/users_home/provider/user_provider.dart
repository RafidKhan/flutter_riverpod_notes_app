import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/models/user_model.dart';
import 'package:notes_flutter/modules/users/users_home/provider/repository.dart';

final usersProvider = FutureProvider<List<UserModel>>((ref) async {
  List<UserModel> usersList = <UserModel>[];
  var response = await UserRepository().fetchUsers();
  List users = response;
  users.forEach((element) {
    usersList.add(UserModel.fromJson(element));
  });

  return usersList;
});
