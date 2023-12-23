import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suidmedia_intern_test/view/first_screen/first_screen_view.dart';
import 'package:suidmedia_intern_test/view/second_screen/second_screen_view.dart';
import 'package:suidmedia_intern_test/view/third_screen/third_screen_view.dart';
import 'package:suidmedia_intern_test/viewmodel/first_screen_viewmodel.dart';
import 'package:suidmedia_intern_test/viewmodel/second_screen_viewmodel.dart';
import 'package:suidmedia_intern_test/viewmodel/third_screen_viewmodel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirstScreenViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SecondScreenViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThirdScreenViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (context) => const FirstScreen(),
              );
            case '/second':
              return MaterialPageRoute(
                builder: (context) => SecondScreen(
                  name: settings.arguments.toString(),
                ),
              );
            case '/third':
              return MaterialPageRoute(
                builder: (context) => const ThirdScreen(),
              );
          }
          return null;
        },
      ),
    );
  }
}
