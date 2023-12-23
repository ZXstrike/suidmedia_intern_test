import 'package:flutter/material.dart';

class SecondScreenViewModel extends ChangeNotifier {
  String selectedUserName = 'Selected User Name';

  late BuildContext context;

  void goTo() {
    Navigator.pushNamed(
      context,
      '/third',
    ).then((value) {
      if (value != null) {
        selectedUserName = value as String;
      }
      notifyListeners();
    });
  }
}
