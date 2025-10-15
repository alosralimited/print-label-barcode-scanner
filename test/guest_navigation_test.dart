import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:print_label_barcode_scanner/main.dart';

void main() {
  testWidgets('Guest navigation shows HomeScreen widgets', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Scroll to make guest button visible
    await tester.dragUntilVisible(
      find.text('Continue as Guest'),
      find.byType(SingleChildScrollView),
      const Offset(0, -50),
    );
    await tester.pumpAndSettle();

    // Tap guest button
    await tester.tap(find.text('Continue as Guest'));
    await tester.pumpAndSettle();

    // Verify HomeScreen elements appear
    expect(find.text('Product Information'), findsOneWidget);
    expect(find.text('Label Preview'), findsOneWidget);
    expect(find.text('Print Options'), findsOneWidget);
  });

  testWidgets('Guest can input product details', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Scroll to guest button and tap
    await tester.dragUntilVisible(
      find.text('Continue as Guest'),
      find.byType(SingleChildScrollView),
      const Offset(0, -50),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue as Guest'));
    await tester.pumpAndSettle();

    // Find product name field
    final productNameField = find.widgetWithText(TextField, 'Product Name');
    expect(productNameField, findsOneWidget);

    // Enter product name
    await tester.enterText(productNameField, 'Test Product');
    await tester.pump();

    // Verify input was captured
    expect(find.text('Test Product'), findsOneWidget);
  });
}
