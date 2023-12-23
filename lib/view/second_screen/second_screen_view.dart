import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suidmedia_intern_test/viewmodel/second_screen_viewmodel.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.name});

  final String name;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late final SecondScreenViewModel pageProvider;

  @override
  void initState() {
    super.initState();

    pageProvider = Provider.of<SecondScreenViewModel>(context, listen: false);
    pageProvider.context = context;
  }

  @override
  void dispose() {
    super.dispose();
    pageProvider.selectedUserName = 'Selected User Name';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blueAccent,
          ),
        ),
        title: const Text(
          'Second Screen',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              widget.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: Center(
                child: Consumer<SecondScreenViewModel>(
                  builder: (context, value, child) => Text(
                    value.selectedUserName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 43, 99, 123),
                ),
              ),
              onPressed: pageProvider.goTo,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: const Text(
                  'Choose a User',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
