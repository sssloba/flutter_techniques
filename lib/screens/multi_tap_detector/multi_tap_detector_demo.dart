import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_techniques/screens/multi_tap_detector/multi_tap_detector.dart';
import 'package:flutter_techniques/widgets/app_scaffold.dart';

class MultiTapDetectorDemo extends StatelessWidget {
  const MultiTapDetectorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Triple Tap Detector',
      body: Column(
        children: [
          Expanded(child: _MultiTapDetectorCounter()),
          Expanded(child: _TripleTapDetectorDemo())
        ],
      ),
    );
  }
}

class _TripleTapDetectorDemo extends StatelessWidget {
  const _TripleTapDetectorDemo();

  @override
  Widget build(BuildContext context) {
    return Center(
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
          final int colorIndex = Random().nextInt(15);

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
    );
  }
}

class _MultiTapDetectorCounter extends StatefulWidget {
  const _MultiTapDetectorCounter();

  @override
  State<_MultiTapDetectorCounter> createState() =>
      __MultiTapDetectorCounterState();
}

class __MultiTapDetectorCounterState extends State<_MultiTapDetectorCounter> {
  int hitCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MultiTapDetector(
            child: Container(
              height: 80,
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(45),
              ),
              child: const Center(
                child: Text(
                  'Hit me continuously as many time as you want!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            onMultiTap: (details) {
              setState(() {
                hitCounter = details.count;
              });
              Timer(const Duration(milliseconds: 600), () {
                if (details.count == hitCounter) {
                  setState(() {
                    hitCounter = 0;
                  });
                }
              });
            },
          ),
          const SizedBox(height: 30.0),
          Text(
            'Button tapped continuously $hitCounter times',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
