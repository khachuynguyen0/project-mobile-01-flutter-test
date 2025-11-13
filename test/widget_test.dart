import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_mobile_01_flutter_test/main.dart';

void main() {
  group('MyApp Widget Tests', () {
    testWidgets('MyApp creates MaterialApp with correct title', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });

  group('MyHomePage Widget Tests', () {
    testWidgets('Initial counter value is 0', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Test Home Page'),
      ));

      expect(find.text('0'), findsOneWidget);
      expect(find.text('You have pushed the button this many times:'), findsOneWidget);
    });

    testWidgets('Increment button increases counter', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Test Home Page'),
      ));

      // Find the increment button by key
      final incrementButton = find.byKey(const Key('incrementButton'));
      
      // Verify initial counter value
      expect(find.text('0'), findsOneWidget);

      // Tap the increment button
      await tester.tap(incrementButton);
      await tester.pump();

      // Verify counter increased
      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);

      // Tap again
      await tester.tap(incrementButton);
      await tester.pump();

      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('Decrement button decreases counter', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Test Home Page'),
      ));

      // Find the decrement button by key
      final decrementButton = find.byKey(const Key('decrementButton'));
      
      // Verify initial counter value
      expect(find.text('0'), findsOneWidget);

      // Tap the decrement button
      await tester.tap(decrementButton);
      await tester.pump();

      // Verify counter decreased
      expect(find.text('-1'), findsOneWidget);
      expect(find.text('0'), findsNothing);

      // Tap again
      await tester.tap(decrementButton);
      await tester.pump();

      expect(find.text('-2'), findsOneWidget);
    });

    testWidgets('Reset button resets counter to 0', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Test Home Page'),
      ));

      final incrementButton = find.byKey(const Key('incrementButton'));
      final resetButton = find.byKey(const Key('resetButton'));

      // Increment counter multiple times
      await tester.tap(incrementButton);
      await tester.pump();
      await tester.tap(incrementButton);
      await tester.pump();
      await tester.tap(incrementButton);
      await tester.pump();

      expect(find.text('3'), findsOneWidget);

      // Reset counter
      await tester.tap(resetButton);
      await tester.pump();

      expect(find.text('0'), findsOneWidget);
      expect(find.text('3'), findsNothing);
    });

    testWidgets('All three buttons are present', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Test Home Page'),
      ));

      expect(find.byKey(const Key('incrementButton')), findsOneWidget);
      expect(find.byKey(const Key('decrementButton')), findsOneWidget);
      expect(find.byKey(const Key('resetButton')), findsOneWidget);
    });

    testWidgets('Buttons have correct icons', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Test Home Page'),
      ));

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });

    testWidgets('Complex interaction test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Test Home Page'),
      ));

      final incrementButton = find.byKey(const Key('incrementButton'));
      final decrementButton = find.byKey(const Key('decrementButton'));
      final resetButton = find.byKey(const Key('resetButton'));

      // Start at 0
      expect(find.text('0'), findsOneWidget);

      // Increment to 5
      for (int i = 0; i < 5; i++) {
        await tester.tap(incrementButton);
        await tester.pump();
      }
      expect(find.text('5'), findsOneWidget);

      // Decrement by 2
      for (int i = 0; i < 2; i++) {
        await tester.tap(decrementButton);
        await tester.pump();
      }
      expect(find.text('3'), findsOneWidget);

      // Reset
      await tester.tap(resetButton);
      await tester.pump();
      expect(find.text('0'), findsOneWidget);

      // Go negative
      await tester.tap(decrementButton);
      await tester.pump();
      await tester.tap(decrementButton);
      await tester.pump();
      expect(find.text('-2'), findsOneWidget);
    });

    testWidgets('AppBar displays correct title', (WidgetTester tester) async {
      const testTitle = 'My Test Title';
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: testTitle),
      ));

      expect(find.text(testTitle), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('Counter text has correct key', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHomePage(title: 'Test Home Page'),
      ));

      expect(find.byKey(const Key('counterText')), findsOneWidget);
    });
  });
}
