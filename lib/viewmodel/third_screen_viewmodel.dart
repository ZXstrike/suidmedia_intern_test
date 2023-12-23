import 'package:flutter/material.dart';
import 'package:suidmedia_intern_test/model/user_model.dart';
import 'package:suidmedia_intern_test/services/user_data_services.dart';

class ThirdScreenViewModel extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  List<User> userList = [];
  int page = 1;
  bool isLoading = true;

  late BuildContext context;

  void onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      _loadMore();
    }
  }

  void _loadMore() {
    page++;
    getUserData();
  }

  Future<void> onRefresh() async {
    userList.clear();
    page = 1;
    isLoading = true;
    notifyListeners();
    getUserData();
  }

  void getUserData() async {
    final List<User> data = await UsersDataservices.getUsersData(page: page);

    if (data.isNotEmpty) {
      userList.addAll(data);
    }
    isLoading = false;
    notifyListeners();
  }

  void selectUser(User user) {
    Navigator.pop(context, '${user.firstName} ${user.lastName}');
  }
}
