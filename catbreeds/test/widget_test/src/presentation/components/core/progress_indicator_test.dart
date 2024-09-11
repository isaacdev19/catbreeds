import 'package:catbreeds/src/presentation/components/core/progress_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_widget.dart';

void main() {
  testWidgets('progress indicator', (tester) async {
    await tester.pumpWidget(const TestWidget(widget: LinearIndicatorValue(value: 0.5, title: 'title')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final titleFinder = find.text('title');

    expect(titleFinder, findsOneWidget);
  });
}
