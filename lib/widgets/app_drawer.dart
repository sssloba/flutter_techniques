import 'package:flutter/material.dart';
import 'package:flutter_techniques/screens/home_page.dart';
import 'package:flutter_techniques/screens/multi_tap_detector/multi_tap_detector_demo.dart';
import 'package:flutter_techniques/widgets/drawer_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerTile(HomePage()),
          DrawerTile(MultiTapDetectorDemo()),
        ],
      ),
    );
  }
}
