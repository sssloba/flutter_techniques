import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLUTTER TECHNIQUES'),
      ),
      body: const Center(
        child: Text(
          'Flutter Techniques Home Page \n Open Drawer for Options',
          style: TextStyle(
            fontSize: 26.0,
            color: Colors.indigo,
            fontWeight: FontWeight.w800,
            height: 3.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
