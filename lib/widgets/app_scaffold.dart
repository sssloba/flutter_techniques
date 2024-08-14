import 'package:flutter/material.dart';
import 'package:flutter_techniques/widgets/app_drawer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.title,
    required this.body,
    super.key,
  });
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}
