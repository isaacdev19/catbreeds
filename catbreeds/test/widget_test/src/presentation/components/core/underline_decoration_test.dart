import 'package:catbreeds/src/presentation/components/core/underline_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_widget.dart';

void main() {
  testWidgets('underline', (tester) async {
    await tester.pumpWidget(const TestWidget(widget: UnderlineDecoration()));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final underLineFinder = find.byKey(const Key('UnderLine'));

    expect(underLineFinder, findsOneWidget);
  });
}
