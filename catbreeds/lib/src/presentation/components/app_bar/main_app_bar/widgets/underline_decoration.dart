part of 'package:catbreeds/src/presentation/components/app_bar/main_app_bar/main_app_bar.dart';

class _UnderlineDecoration extends StatelessWidget {
  const _UnderlineDecoration();

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.topLeft,
    child: Container(
      width: 25,
      height: 3,
      color: Colors.black,
    ),
  );
}
