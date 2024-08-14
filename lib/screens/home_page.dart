import 'package:flutter/material.dart';
import 'package:flutter_techniques/widgets/app_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'FLUTTER TECHNIQUES',
      body: Center(
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
