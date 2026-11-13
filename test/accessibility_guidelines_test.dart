import 'package:flutter_accessibility_lab/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('home screen meets automated accessibility guidelines', (
    tester,
  ) async {
    final handle = tester.ensureSemantics();

    await tester.pumpWidget(const AccessibilityLabApp());
    await tester.pumpAndSettle();

    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(textContrastGuideline));

    handle.dispose();
  });

  testWidgets('home screen exposes one semantic button per demo', (
    tester,
  ) async {
    final handle = tester.ensureSemantics();

    await tester.pumpWidget(const AccessibilityLabApp());

    expect(
      find.bySemanticsLabel(
        RegExp('Accessible form feedback.*Validation'),
      ),
      findsOneWidget,
    );
    expect(
      find.bySemanticsLabel(RegExp('Focus management.*Intentional focus')),
      findsOneWidget,
    );
    expect(
      find.bySemanticsLabel(
        RegExp('Dynamic announcements.*Non-disruptive'),
      ),
      findsOneWidget,
    );

    handle.dispose();
  });
}
