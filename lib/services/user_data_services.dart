import 'package:dio/dio.dart';
import 'package:suidmedia_intern_test/model/user_model.dart';

class UsersDataservices {
  static final _dio = Dio();

  static Future<List<User>> getUsersData(
      {required int page, int itemPerPage = 10}) async {
    try {
      final Response response = await _dio
          .get("https://reqres.in/api/users?page=$page&per_page=$itemPerPage");
      final userData = UsersData.fromJson({'users': response.data['data']});

      if (userData.users.isNotEmpty) {
        return userData.users;
      }
    } catch (e) {
      print('=> $e');
      return [];
    }
    return [];
  }
}

void main() async {
  print(await UsersDataservices.getUsersData(page: 1));
}
