import 'package:catbreeds/src/presentation/components/text/cb_text.dart';
import 'package:flutter/material.dart';

import '../ui_constants.dart';

class LinearIndicatorValue extends StatelessWidget {
  const LinearIndicatorValue({super.key, required this.value, required this.title});

  final double value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CBText.bodyMedium(title)),
        SizedBox(
          width: 200,
          child: LinearProgressIndicator(
            minHeight: 8,
            backgroundColor: Colors.grey,
            value: value,
            color: Colors.orange,
            borderRadius: borderRadius,
          ),
        )
      ],
    );
  }
}
