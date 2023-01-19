import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_flutter/models/user_model.dart';
import 'package:notes_flutter/modules/users/users_home/provider/repository.dart';
import 'package:notes_flutter/utils/dio_provider/dio_provider.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref.watch(dioProvider));
});

final usersProvider = FutureProvider<List<UserModel>>((ref) async {
  List<UserModel> usersList = <UserModel>[];
  final repository = ref.watch(userRepositoryProvider);
  var response = await repository.fetchUsers();
  List users = response;
  users.forEach((element) {
    usersList.add(UserModel.fromJson(element));
  });

  return usersList;
});
