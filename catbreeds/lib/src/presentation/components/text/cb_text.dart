import 'package:catbreeds/src/presentation/components/theme/text_theme.dart';
import 'package:flutter/material.dart';

class CBText extends StatelessWidget {
  const CBText({
    super.key,
    required this.text,
    required this.textStyle,
    this.fontStyle = FontStyle.italic,
    this.textAlign = TextAlign.start,
    this.textOverFlow = TextOverflow.ellipsis,
    this.maxLines = 10,
  });

  factory CBText.headlineMedium(
      String text, {
        Key? key,
        TextStyle? textStyle,
        TextAlign? textAlign,
        TextOverflow? textOverFlow,
        int? maxLines,
        Color? textColor,
        double? fontSize,
        FontWeight? fontWeight,
        double? letterSpacing,
        String? fontFamily,
        double? lineHeight,
      }) =>
      CBText(
          key: key,
          text: text,
          textAlign: textAlign,
          textOverFlow: textOverFlow,
          maxLines: maxLines,
          textStyle: cbTextTheme.headlineMedium!.copyWith(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            fontFamily: fontFamily,
            height: lineHeight,
          ));

  factory CBText.headlineSmall(
      String text, {
        Key? key,
        TextStyle? textStyle,
        TextAlign? textAlign,
        TextOverflow? textOverFlow,
        int? maxLines,
        Color? textColor,
        double? fontSize,
        FontWeight? fontWeight,
        double? letterSpacing,
        String? fontFamily,
        double? lineHeight,
      }) =>
      CBText(
          key: key,
          text: text,
          textAlign: textAlign,
          textOverFlow: textOverFlow,
          maxLines: maxLines,
          textStyle: cbTextTheme.headlineSmall!.copyWith(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            fontFamily: fontFamily,
            height: lineHeight,
          ));

  factory CBText.titleLarge(
      String text, {
        Key? key,
        TextStyle? textStyle,
        TextAlign? textAlign,
        TextOverflow? textOverFlow,
        int? maxLines,
        Color? textColor,
        double? fontSize,
        FontWeight? fontWeight,
        double? letterSpacing,
        String? fontFamily,
        double? lineHeight,
      }) =>
      CBText(
          key: key,
          text: text,
          textAlign: textAlign,
          textOverFlow: textOverFlow,
          maxLines: maxLines,
          textStyle: cbTextTheme.titleLarge!.copyWith(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            fontFamily: fontFamily,
            height: lineHeight,
          ));

  factory CBText.bodyLarge(
      String text, {
        Key? key,
        FontStyle? fontStyle,
        TextStyle? textStyle,
        TextAlign? textAlign,
        TextOverflow? textOverFlow,
        int? maxLines,
        Color? textColor,
        double? fontSize,
        FontWeight? fontWeight,
        double? letterSpacing,
        String? fontFamily,
        double? lineHeight,
      }) =>
      CBText(
          key: key,
          text: text,
          textAlign: textAlign,
          textOverFlow: textOverFlow,
          maxLines: maxLines,
          textStyle: cbTextTheme.bodyLarge!.copyWith(
            color: textColor,
            fontSize: fontSize,
            fontStyle: fontStyle,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            fontFamily: fontFamily,
            height: lineHeight,
          ));

  factory CBText.titleMedium(
      String text, {
        Key? key,
        TextStyle? textStyle,
        TextAlign? textAlign,
        TextOverflow? textOverFlow,
        int? maxLines,
        Color? textColor,
        double? fontSize,
        FontWeight? fontWeight,
        double? letterSpacing,
        String? fontFamily,
        double? lineHeight,
      }) =>
      CBText(
        key: key,
        text: text,
        textAlign: textAlign,
        textOverFlow: textOverFlow,
        maxLines: maxLines,
        textStyle: cbTextTheme.titleMedium!.copyWith(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily,
          height: lineHeight,
        ),
      );

  factory CBText.labelLarge(
      String text, {
        Key? key,
        TextAlign? textAlign,
        TextOverflow? textOverFlow,
        int? maxLines,
        Color? textColor,
        double? fontSize,
        FontWeight? fontWeight,
        double? letterSpacing,
        String? fontFamily,
        double? lineHeight,
        FontStyle? fontStyle,
      }) =>
      CBText(
          key: key,
          text: text,
          textAlign: textAlign,
          textOverFlow: textOverFlow,
          maxLines: maxLines,
          textStyle: cbTextTheme.labelLarge!.copyWith(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            letterSpacing: letterSpacing,
            fontFamily: fontFamily,
            height: lineHeight,
          ));

  factory CBText.bodySmall(
      String text, {
        Key? key,
        TextStyle? textStyle,
        TextAlign? textAlign,
        TextOverflow? textOverFlow,
        int? maxLines,
        Color? textColor,
        double? fontSize,
        FontWeight? fontWeight,
        double? letterSpacing,
        String? fontFamily,
        double? lineHeight,
      }) =>
      CBText(
        key: key,
        text: text,
        textAlign: textAlign,
        textOverFlow: textOverFlow,
        maxLines: maxLines,
        textStyle: cbTextTheme.bodySmall!.copyWith(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily,
          height: lineHeight,
        ),
      );

  factory CBText.labelSmall(
      String text, {
        Key? key,
        TextStyle? textStyle,
        TextAlign? textAlign,
        TextOverflow? textOverFlow,
        int? maxLines,
        Color? textColor,
        double? fontSize,
        FontWeight? fontWeight,
        double? letterSpacing,
        String? fontFamily,
        double? lineHeight,
      }) =>
      CBText(
        key: key,
        text: text,
        textAlign: textAlign,
        textOverFlow: textOverFlow,
        maxLines: maxLines,
        textStyle: cbTextTheme.labelSmall!.copyWith(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily,
          height: lineHeight,
        ),
      );

  factory CBText.bodyMedium(
      String text, {
        Key? key,
        TextStyle? textStyle,
        TextAlign? textAlign,
        TextOverflow? textOverFlow,
        int? maxLines,
        Color? textColor,
        double? fontSize,
        FontWeight? fontWeight,
        double? letterSpacing,
        String? fontFamily,
        double? lineHeight,
      }) =>
      CBText(
        key: key,
        text: text,
        textAlign: textAlign,
        textOverFlow: textOverFlow,
        maxLines: maxLines,
        textStyle: cbTextTheme.bodyMedium!.copyWith(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily,
          height: lineHeight,
        ),
      );

  factory CBText.titleSmall(
      String text, {
        Key? key,
        TextStyle? textStyle,
        TextAlign? textAlign,
        TextOverflow? textOverFlow,
        int? maxLines,
        Color? textColor,
        double? fontSize,
        FontWeight? fontWeight,
        double? letterSpacing,
        String? fontFamily,
        double? lineHeight,
      }) =>
      CBText(
        key: key,
        text: text,
        textAlign: textAlign,
        textOverFlow: textOverFlow,
        maxLines: maxLines,
        textStyle: cbTextTheme.titleSmall!.copyWith(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          fontFamily: fontFamily,
          height: lineHeight,
        ),
      );

  final String text;
  final FontStyle fontStyle;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextOverflow? textOverFlow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: textStyle,
    textAlign: textAlign,
    overflow: textOverFlow,
    maxLines: maxLines,
  );
}
