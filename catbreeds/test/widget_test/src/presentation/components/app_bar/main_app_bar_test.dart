import 'package:catbreeds/src/presentation/components/app_bar/cb_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_widget.dart';

void main() {
  testWidgets('main app bar', (tester) async {
    await tester.pumpWidget(const TestWidget(widget: CBAppBar.main(textTitle: 'Home')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final titleFinder = find.text('Home');
    final imageFinder = find.image(const AssetImage('assets/images/logo.png'));
    final textFieldFinder = find.byIcon(Icons.search);

    expect(titleFinder, findsOneWidget);
    expect(imageFinder, findsOneWidget);
    expect(textFieldFinder, findsOneWidget);
  });
}
