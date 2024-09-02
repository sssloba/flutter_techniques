import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({this.milliseconds = 500});

  void run(VoidCallback action) {
    // If timer is already active, timer will be cancelled and previous action will not be executed.
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    // New timer is set to perform the action with a delay according to the defined [milliseconds].
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
