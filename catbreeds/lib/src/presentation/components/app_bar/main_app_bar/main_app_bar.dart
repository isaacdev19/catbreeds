import 'package:catbreeds/src/presentation/components/app_bar/cb_app_bar.dart';
import 'package:catbreeds/src/presentation/components/core/underline_decoration.dart';
import 'package:catbreeds/src/presentation/components/text/cb_text.dart';
import 'package:flutter/material.dart';

part 'package:catbreeds/src/presentation/components/app_bar/main_app_bar/widgets/title_widget.dart';

class MainAppBar extends CBAppBar {
  const MainAppBar({
    super.key,
    required this.textTitle,
    this.hasChatButton = true,
    this.onSearchChange,
  });

  final String textTitle;
  final bool hasChatButton;
  final void Function(String)? onSearchChange;

  @override
  Widget build(BuildContext context) => AppBar(
    backgroundColor: Theme.of(context).colorScheme.secondary,
    surfaceTintColor: Theme.of(context).colorScheme.secondary,
    titleSpacing: 0,
    leadingWidth: 0,
    centerTitle: false,
    elevation: 0,
    title: _TitleWidget(
      textTitle: textTitle,
      hasChatButton: hasChatButton,
      onSearchChange: onSearchChange,
    ),
  );
}