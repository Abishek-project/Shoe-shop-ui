import 'package:flutter/material.dart';

import 'screens/intro_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoe shop',
        theme: ThemeData(),
        home: const IntroPageView());
  }
}
