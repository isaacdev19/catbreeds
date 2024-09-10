import 'package:catbreeds/src/presentation/components/app_bar/cb_app_bar.dart';
import 'package:catbreeds/src/presentation/components/core/underline_decoration.dart';
import 'package:catbreeds/src/presentation/components/text/cb_text.dart';
import 'package:catbreeds/src/presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'package:catbreeds/src/presentation/components/app_bar/secondary_app_bar/widgets/title_widget.dart';

class SecondaryAppBar extends CBAppBar {
  const SecondaryAppBar({
    super.key,
    required this.textTitle,
    this.hasChatButton = true,
  });

  final String textTitle;
  final bool hasChatButton;

  @override
  Widget build(BuildContext context) => AppBar(
    backgroundColor: Theme.of(context).colorScheme.secondary,
    surfaceTintColor: Theme.of(context).colorScheme.secondary,
    titleSpacing: 0,
    leadingWidth: 0,
    centerTitle: false,
    elevation: 0,
    leading: Container(),
    title: _TitleWidget(
      textTitle: textTitle,
      hasChatButton: hasChatButton,
    ),
  );
}