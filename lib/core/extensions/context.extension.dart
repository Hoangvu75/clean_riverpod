import 'package:flutter/material.dart';

import '../ui/theme_color.dart';
import '../ui/theme_text.dart';

extension ContextExtension on BuildContext {
  ThemeColor get color => Theme.of(this).extension<ThemeColor>()!;

  ThemeText get textStyle {
    final themeText = Theme.of(this).extension<ThemeText>();
    if (themeText == null) return ThemeText.instance;
    return themeText;
  }
}
