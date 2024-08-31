import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TripleTapDetector extends StatelessWidget {
  const TripleTapDetector({
    required this.child,
    required this.onTripleTap,
    super.key,
  });

  final Widget child;
  final VoidCallback onTripleTap;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        // Register a SerialTapGestureRecognizer
        SerialTapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<SerialTapGestureRecognizer>(
          () => SerialTapGestureRecognizer(),
          (SerialTapGestureRecognizer instance) {
            instance.onSerialTapDown = (SerialTapDownDetails details) {
              if (details.count == 3) {
                // Use the [onSerialTapDown] callback to check if three taps have been made
                onTripleTap();
              }
            };
          },
        ),
      },
      child: child,
    );
  }
}

class MultiTapDetector extends StatelessWidget {
  const MultiTapDetector({
    required this.child,
    required this.onMultiTap,
    super.key,
  });

  final Widget child;
  final Function(SerialTapDownDetails details) onMultiTap;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        // Register a SerialTapGestureRecognizer
        SerialTapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<SerialTapGestureRecognizer>(
          () => SerialTapGestureRecognizer(),
          (SerialTapGestureRecognizer instance) {
            instance.onSerialTapDown = (SerialTapDownDetails details) {
              // Use the [onSerialTapDown] callback to check how many taps have been made
              onMultiTap(details);
            };
          },
        ),
      },
      child: child,
    );
  }
}
