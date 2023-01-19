import 'package:dio/dio.dart';
import 'package:notes_flutter/utils/common_methods.dart';

class UserRepository {
  Dio dio = Dio();

  Future fetchUsers() async {
    try {
      var response = await dio.get(USERS_API_URL);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        return response.data;
      }
    } catch (e) {}
  }
}
