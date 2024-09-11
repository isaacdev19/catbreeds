part of 'package:catbreeds/src/presentation/components/app_bar/secondary_app_bar/secondary_app_bar.dart';

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.textTitle,
    this.hasChatButton = true,
  });

  final String textTitle;
  final bool hasChatButton;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => context.pop(),
              child: const Icon(Icons.arrow_back),
            ),
            const Spacer(),
            CBText.headlineSmall(textTitle),
            const Spacer(),
            Image.asset(
              'assets/images/logo.png',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ],
    ),
  );
}