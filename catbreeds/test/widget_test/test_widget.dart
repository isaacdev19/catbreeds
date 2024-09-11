import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: widget,
    );
  }
}
