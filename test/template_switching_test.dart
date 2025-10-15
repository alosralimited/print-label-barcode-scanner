import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:print_label_barcode_scanner/main.dart';

void main() {
  testWidgets('App initializes correctly', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Verify login screen appears
    expect(find.text('Continue as Guest'), findsOneWidget);
  });

  testWidgets('Guest login works', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Scroll to guest button
    await tester.dragUntilVisible(
      find.text('Continue as Guest'),
      find.byType(SingleChildScrollView),
      const Offset(0, -50),
    );
    await tester.pump();

    // Tap guest button
    await tester.tap(find.text('Continue as Guest'));
    await tester.pump();

    // Verify we're on a different screen (login screen should be gone)
    expect(find.text('Sign in to manage your labels'), findsNothing);
  });
}
