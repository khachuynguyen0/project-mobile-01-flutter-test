import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:project_mobile_01_flutter_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('complete app flow test', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify app loads with initial state
      expect(find.text('Flutter Test Demo Home Page'), findsOneWidget);
      expect(find.text('You have pushed the button this many times:'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);

      // Test increment functionality
      final incrementButton = find.byKey(const Key('incrementButton'));
      await tester.tap(incrementButton);
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);

      await tester.tap(incrementButton);
      await tester.pumpAndSettle();
      expect(find.text('2'), findsOneWidget);

      // Test decrement functionality
      final decrementButton = find.byKey(const Key('decrementButton'));
      await tester.tap(decrementButton);
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);

      // Test reset functionality
      final resetButton = find.byKey(const Key('resetButton'));
      await tester.tap(resetButton);
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('stress test - multiple rapid taps', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final incrementButton = find.byKey(const Key('incrementButton'));

      // Rapidly tap increment button
      for (int i = 0; i < 10; i++) {
        await tester.tap(incrementButton);
      }
      await tester.pumpAndSettle();

      expect(find.text('10'), findsOneWidget);
    });

    testWidgets('navigation and state persistence test', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final incrementButton = find.byKey(const Key('incrementButton'));
      
      // Increment counter
      await tester.tap(incrementButton);
      await tester.tap(incrementButton);
      await tester.tap(incrementButton);
      await tester.pumpAndSettle();

      expect(find.text('3'), findsOneWidget);

      // Counter state should remain (no navigation in this simple app,
      // but we're testing that the state is maintained through rebuilds)
      await tester.pump();
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('negative counter values work correctly', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final decrementButton = find.byKey(const Key('decrementButton'));

      // Test negative values
      for (int i = 0; i < 5; i++) {
        await tester.tap(decrementButton);
      }
      await tester.pumpAndSettle();

      expect(find.text('-5'), findsOneWidget);
    });

    testWidgets('mixed operations test', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final incrementButton = find.byKey(const Key('incrementButton'));
      final decrementButton = find.byKey(const Key('decrementButton'));
      final resetButton = find.byKey(const Key('resetButton'));

      // Increment 7 times
      for (int i = 0; i < 7; i++) {
        await tester.tap(incrementButton);
      }
      await tester.pumpAndSettle();
      expect(find.text('7'), findsOneWidget);

      // Decrement 3 times
      for (int i = 0; i < 3; i++) {
        await tester.tap(decrementButton);
      }
      await tester.pumpAndSettle();
      expect(find.text('4'), findsOneWidget);

      // Reset
      await tester.tap(resetButton);
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);

      // Decrement 2 times (should go negative)
      for (int i = 0; i < 2; i++) {
        await tester.tap(decrementButton);
      }
      await tester.pumpAndSettle();
      expect(find.text('-2'), findsOneWidget);

      // Increment back to positive
      for (int i = 0; i < 5; i++) {
        await tester.tap(incrementButton);
      }
      await tester.pumpAndSettle();
      expect(find.text('3'), findsOneWidget);
    });
  });
}
