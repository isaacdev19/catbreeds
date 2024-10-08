import 'package:flutter/material.dart';

class UnderlineDecoration extends StatelessWidget {
  const UnderlineDecoration({super.key});

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.topLeft,
    child: Container(
      key: const Key('UnderLine'),
      width: 25,
      height: 3,
      color: Colors.black,
    ),
  );
}
