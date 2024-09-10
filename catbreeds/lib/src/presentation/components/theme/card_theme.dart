import 'package:catbreeds/src/presentation/components/theme/color_theme.dart';
import 'package:catbreeds/src/presentation/components/ui_constants.dart';
import 'package:flutter/material.dart';

const cbCardTheme = CardTheme(
  clipBehavior: Clip.hardEdge,
  color: colorFondoCards,
  surfaceTintColor: colorFondoCards,
  elevation: 3,
  margin: EdgeInsets.all(0),
  shadowColor: colorSombra,
  shape: RoundedRectangleBorder(borderRadius: borderRadius),
);