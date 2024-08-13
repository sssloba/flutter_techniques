import 'package:flutter/material.dart';
import 'package:flutter_techniques/screens/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Techniques',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[400],
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.blueGrey,
          foregroundColor: Colors.greenAccent,
        ),
        dividerTheme: const DividerThemeData(
          thickness: 2,
          space: 0,
          color: Colors.blueGrey,
        ),
      ),
      home: const HomePage(),
    );
  }
}
