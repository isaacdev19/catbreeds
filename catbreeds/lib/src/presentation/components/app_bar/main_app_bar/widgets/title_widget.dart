part of 'package:catbreeds/src/presentation/components/app_bar/main_app_bar/main_app_bar.dart';

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.textTitle,
    this.hasChatButton = true,
    this.onSearchChange,
  });

  final String textTitle;
  final bool hasChatButton;
  final void Function(String)? onSearchChange;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(child: CBText.headlineSmall(textTitle)),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  onChanged: onSearchChange,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search)
                  ),
                ),
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ],
        ),
        const UnderlineDecoration(),
      ],
    ),
  );
}
