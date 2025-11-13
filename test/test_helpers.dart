/// Common test utilities and helpers
library test_helpers;

import 'package:flutter_test/flutter_test.dart';

/// Matcher to verify a number is within a range
Matcher inRange(num min, num max) {
  return _InRangeMatcher(min, max);
}

class _InRangeMatcher extends Matcher {
  final num _min;
  final num _max;

  const _InRangeMatcher(this._min, this._max);

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! num) return false;
    return item >= _min && item <= _max;
  }

  @override
  Description describe(Description description) {
    return description.add('a number between $_min and $_max');
  }

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    if (item is! num) {
      return mismatchDescription.add('is not a number');
    }
    return mismatchDescription.add('$item is not in range [$_min, $_max]');
  }
}

/// Helper function to create test delays
Future<void> testDelay([Duration duration = const Duration(milliseconds: 100)]) {
  return Future.delayed(duration);
}

/// Helper to pump widget with standard wrapper
Future<void> pumpTestWidget(
  WidgetTester tester,
  Widget widget, {
  bool wrapInMaterialApp = true,
}) async {
  if (wrapInMaterialApp) {
    await tester.pumpWidget(
      MaterialApp(home: widget),
    );
  } else {
    await tester.pumpWidget(widget);
  }
}
