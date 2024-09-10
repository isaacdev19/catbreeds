import 'package:flutter/material.dart';
import 'package:catbreeds/src/presentation/components/app_bar/main_app_bar/main_app_bar.dart';

abstract class CBAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CBAppBar({super.key});

  const factory CBAppBar.main({
    Key? key,
    required String textTitle,
    bool hasChatButton,
    void Function() onChatButtonPressed,
  }) = MainAppBar;


  @override
  Size get preferredSize => const Size.fromHeight(55);
}