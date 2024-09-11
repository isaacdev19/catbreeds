import 'package:catbreeds/src/presentation/components/app_bar/cb_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_widget.dart';

void main() {
  testWidgets('secondary app bar', (tester) async {
    await tester.pumpWidget(const TestWidget(widget: CBAppBar.secondary(textTitle: 'Detail')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final titleFinder = find.text('Detail');
    final imageFinder = find.image(const AssetImage('assets/images/logo.png'));

    expect(titleFinder, findsOneWidget);
    expect(imageFinder, findsOneWidget);
  });
}
