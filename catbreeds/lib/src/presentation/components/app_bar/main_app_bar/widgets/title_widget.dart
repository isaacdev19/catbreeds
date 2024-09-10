part of 'package:catbreeds/src/presentation/components/app_bar/main_app_bar/main_app_bar.dart';

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.textTitle,
    this.hasChatButton = true,
    this.onChatButtonPressed,
  });

  final String textTitle;
  final bool hasChatButton;
  final void Function()? onChatButtonPressed;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Column(
      children: [
        Row(
          children: [
            CBText.headlineSmall(textTitle),
          ],
        ),
        const _UnderlineDecoration(),
      ],
    ),
  );
}
