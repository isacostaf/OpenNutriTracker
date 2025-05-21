import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:opennutritracker/main.dart' as app;

void main() {
  // Initialize integration test environment
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Group of tests related to privacy policy
  group('Privacy Policy Test', () {
    testWidgets('Basic test: Verify if policy acceptance is required',
        (WidgetTester tester) async {
      // Step 1: Start the app
      app.main();
      await tester.pumpAndSettle(); // Wait for the interface to load

      // Step 2: Check if the "Start" button is visible
      final startButton = find.text('Start');
      expect(startButton, findsOneWidget, reason: 'The Start button should be visible');

      // Step 3: Try to click the button without accepting the policy
      await tester.tap(startButton);
      await tester.pumpAndSettle();

      // Step 4: Verify we are still on the first page
      expect(find.text('policy'), findsOneWidget, 
          reason: 'We should stay on the first page because the policy was not accepted');

      // Step 5: Find and click the policy checkbox
      final policyCheckbox = find.byType(Checkbox).first;
      await tester.tap(policyCheckbox);
      await tester.pumpAndSettle();

      // Step 6: Click the Start button again
      await tester.tap(startButton);
      await tester.pumpAndSettle();

      // Step 7: Verify we moved to the next page
      expect(find.text('gender'), findsOneWidget,
          reason: 'We should advance to the gender selection page after accepting the policy');
    });
  });
} 