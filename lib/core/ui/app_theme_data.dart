import 'package:flutter/material.dart';

import 'theme_color.dart';
import 'theme_text.dart';

class AppThemeData {
  static final lightTheme = ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      ThemeColor.light,
      ThemeText.instance,
    ],
  );

  static final darkTheme = ThemeData.dark().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      ThemeColor.dark,
      ThemeText.instance,
    ],
  );
}