import 'package:catbreeds/src/presentation/components/text/cb_text.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_widget.dart';

void main() {
  testWidgets('bodyMedium', (tester) async {
    await tester.pumpWidget(TestWidget(widget: CBText.bodyMedium('bodyMedium')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final titleFinder = find.text('bodyMedium');

    expect(titleFinder, findsOneWidget);
  });

  testWidgets('bodyLarge', (tester) async {
    await tester.pumpWidget(TestWidget(widget: CBText.bodyLarge('bodyLarge')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final titleFinder = find.text('bodyLarge');

    expect(titleFinder, findsOneWidget);
  });

  testWidgets('bodySmall', (tester) async {
    await tester.pumpWidget(TestWidget(widget: CBText.bodySmall('bodySmall')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final titleFinder = find.text('bodySmall');

    expect(titleFinder, findsOneWidget);
  });

  testWidgets('labelLarge', (tester) async {
    await tester.pumpWidget(TestWidget(widget: CBText.labelLarge('labelLarge')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final titleFinder = find.text('labelLarge');

    expect(titleFinder, findsOneWidget);
  });

  testWidgets('labelSmall', (tester) async {
    await tester.pumpWidget(TestWidget(widget: CBText.labelSmall('labelSmall')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final titleFinder = find.text('labelSmall');

    expect(titleFinder, findsOneWidget);
  });

  testWidgets('titleMedium', (tester) async {
    await tester.pumpWidget(TestWidget(widget: CBText.titleMedium('titleMedium')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final titleFinder = find.text('titleMedium');

    expect(titleFinder, findsOneWidget);
  });

  testWidgets('titleLarge', (tester) async {
    await tester.pumpWidget(TestWidget(widget: CBText.titleLarge('titleLarge')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final titleFinder = find.text('titleLarge');

    expect(titleFinder, findsOneWidget);
  });

  testWidgets('titleSmall', (tester) async {
    await tester.pumpWidget(TestWidget(widget: CBText.titleSmall('titleSmall')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final titleFinder = find.text('titleSmall');

    expect(titleFinder, findsOneWidget);
  });

  testWidgets('headlineSmall', (tester) async {
    await tester.pumpWidget(TestWidget(widget: CBText.headlineSmall('headlineSmall')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final titleFinder = find.text('headlineSmall');

    expect(titleFinder, findsOneWidget);
  });

  testWidgets('headlineMedium', (tester) async {
    await tester.pumpWidget(TestWidget(widget: CBText.headlineMedium('headlineMedium')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    final titleFinder = find.text('headlineMedium');

    expect(titleFinder, findsOneWidget);
  });
}
