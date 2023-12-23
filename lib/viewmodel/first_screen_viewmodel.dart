import 'package:flutter/material.dart';
import 'package:suidmedia_intern_test/view/first_screen/widget/confirmation_widget.dart';

class FirstScreenViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();

  late BuildContext context;

  void checkPalindrome() {
    final text = palindromeController.text.replaceAll(' ', '').toLowerCase();
    String message = 'Palindrome field is empty!';
    if (text != '') {
      String reversed = text.toString().split('').reversed.join('');

      message = 'Not Palindrome';
      if (text == reversed) {
        message = 'Is Palindrome';
      }
    }

    showDialog(
      context: context,
      builder: (context) =>
          Confirmation(tittle: 'Palindrome Check', message: message),
    );
  }

  void goTo() {
    if (nameController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const Confirmation(
            message: 'Name field is empty!', tittle: 'Warning'),
      );
    } else {
      Navigator.pushNamed(context, '/second', arguments: nameController.text);
    }
  }
}
