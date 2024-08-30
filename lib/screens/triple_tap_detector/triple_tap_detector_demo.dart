import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_techniques/screens/triple_tap_detector/triple_tap_detector.dart';
import 'package:flutter_techniques/widgets/app_scaffold.dart';

class TripleTapDetectorDemo extends StatelessWidget {
  const TripleTapDetectorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Triple Tap Detector',
      body: Center(
        child: TripleTapDetector(
          child: Container(
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(45),
              ),
              child: const Center(
                child: Text(
                  'Hit me 3 times!!!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              )),
          onTripleTap: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            int colorIndex = Random().nextInt(15);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(
                  'Triple Tap Detected!!!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.primaries[colorIndex],
              ),
            );
          },
        ),
      ),
    );
  }
}
