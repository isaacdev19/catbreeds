import 'package:catbreeds/src/presentation/components/theme/card_theme.dart';
import 'package:catbreeds/src/presentation/components/theme/color_theme.dart';
import 'package:catbreeds/src/presentation/components/theme/text_theme.dart';
import 'package:flutter/material.dart';

final ThemeData cbLightAppTheme = ThemeData(
  colorScheme: cbColorScheme,
  scaffoldBackgroundColor: cbColorScheme.background,

  /// Sub-Themes
  textTheme: cbTextTheme,
  cardTheme: cbCardTheme,
);