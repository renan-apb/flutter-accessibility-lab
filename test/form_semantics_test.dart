import 'package:flutter/material.dart';
import 'package:flutter_accessibility_lab/features/form/accessible_form_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildSubject() {
    return const MaterialApp(home: AccessibleFormScreen());
  }

  testWidgets('invalid submission exposes a recoverable error and status', (
    tester,
  ) async {
    final handle = tester.ensureSemantics();
    addTearDown(handle.dispose);

    await tester.pumpWidget(buildSubject());
    await tester.tap(find.text('Save preferences'));
    await tester.pump();

    expect(find.text('Enter an email address.'), findsOneWidget);
    expect(
      find.text('Form not submitted. Review the email field.'),
      findsOneWidget,
    );
    expect(
      find.bySemanticsLabel(
        'Form not submitted. Review the email field.',
      ),
      findsOneWidget,
    );
  });

  testWidgets('valid submission updates the semantic live region', (
    tester,
  ) async {
    final handle = tester.ensureSemantics();
    addTearDown(handle.dispose);

    await tester.pumpWidget(buildSubject());
    await tester.enterText(
      find.byType(TextFormField),
      'renan@example.com',
    );
    await tester.tap(find.text('Save preferences'));
    await tester.pump();

    expect(
      find.bySemanticsLabel(
        'Preferences saved. Product updates are disabled.',
      ),
      findsOneWidget,
    );
  });
}

