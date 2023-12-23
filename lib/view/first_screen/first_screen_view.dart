import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suidmedia_intern_test/viewmodel/first_screen_viewmodel.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late final FirstScreenViewModel pageProvider;

  @override
  void initState() {
    super.initState();

    pageProvider = Provider.of<FirstScreenViewModel>(context, listen: false);

    pageProvider.context = context;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: const AssetImage('assets/images/ic_photo.png'),
                radius: screenWidth * 0.18,
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: pageProvider.nameController,
                style: const TextStyle(
                  fontSize: 21,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(226, 227, 228, 1),
                      width: 0.5,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(104, 103, 119, 0.36),
                  ),
                  hintText: 'Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: pageProvider.palindromeController,
                style: const TextStyle(
                  fontSize: 21,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(226, 227, 228, 1),
                      width: 0.5,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(104, 103, 119, 0.36),
                  ),
                  hintText: 'Palindrome',
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 43, 99, 123),
                  ),
                ),
                onPressed: pageProvider.checkPalindrome,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: screenWidth,
                  child: const Text(
                    'CHECK',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
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
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: screenWidth,
                  child: const Text(
                    'NEXT',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
