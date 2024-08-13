import 'package:flutter/material.dart';

extension SplitStringOnCapitals on Widget {
  /// This method will split String from Widget's name on Capitals and add empty space between.
  String splitOnCapitals() {
    final widgetString = toString();

    /// [RegExp] for finding all Capital letters.
    /// Sign + in expression ensures that will match as many consecutive Capital letters as possible.
    /// Without + sign it would match every Capital letter.
    final regExp = RegExp(r'([A-Z])+');

    /// Here we are adding empty space before every Capital letter.
    final splitedString = widgetString
        .replaceAllMapped(regExp, (Match match) => ' ${match.group(0)}')
        .trim();

    return splitedString;
  }
}
