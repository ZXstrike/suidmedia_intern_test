import 'package:flutter/material.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({super.key, required this.message, required this.tittle});

  final String tittle;

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(tittle),
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
