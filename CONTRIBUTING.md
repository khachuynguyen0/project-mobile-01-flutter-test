# Contributing to Flutter Test Suite Project

Thank you for your interest in contributing! This document provides guidelines for contributing to this project.

## Testing Guidelines

### Test Requirements

All contributions must include appropriate tests:

1. **New Features**: Must include unit tests and widget tests
2. **Bug Fixes**: Must include a test that reproduces the bug
3. **Refactoring**: Existing tests must pass
4. **Test Coverage**: Maintain minimum 80% code coverage

### Test Types

#### Unit Tests
- Test individual functions and classes
- Mock external dependencies
- Test edge cases and error conditions
- Location: `test/*_test.dart`

Example:
```dart
test('adds two numbers correctly', () {
  final calculator = Calculator();
  expect(calculator.add(2, 3), equals(5));
});
```

#### Widget Tests
- Test UI components and interactions
- Use widget keys for reliable testing
- Test user interactions
- Location: `test/widget_test.dart`

Example:
```dart
testWidgets('button tap increases counter', (tester) async {
  await tester.pumpWidget(MyApp());
  await tester.tap(find.byKey(Key('incrementButton')));
  await tester.pump();
  expect(find.text('1'), findsOneWidget);
});
```

#### Integration Tests
- Test complete user flows
- Test app-level interactions
- Location: `integration_test/*.dart`

Example:
```dart
testWidgets('complete user flow', (tester) async {
  app.main();
  await tester.pumpAndSettle();
  // Test complete flow
});
```

### Running Tests

Before submitting a PR:

```bash
# Run all tests
make test

# Run with coverage
make test-coverage

# Check formatting
make format

# Run static analysis
make analyze
```

Or using Flutter commands:

```bash
# All tests
flutter test

# Specific test file
flutter test test/calculator_test.dart

# Integration tests
flutter test integration_test/

# With coverage
flutter test --coverage
```

### Test Best Practices

1. **Naming**: Use descriptive test names that explain what is being tested
   ```dart
   test('throws ArgumentError when dividing by zero', () { ... });
   ```

2. **Structure**: Follow Arrange-Act-Assert pattern
   ```dart
   test('description', () {
     // Arrange
     final calculator = Calculator();
     
     // Act
     final result = calculator.add(2, 3);
     
     // Assert
     expect(result, equals(5));
   });
   ```

3. **Organization**: Group related tests
   ```dart
   group('Calculator', () {
     group('add', () {
       test('adds positive numbers', () { ... });
       test('adds negative numbers', () { ... });
     });
   });
   ```

4. **Setup/Teardown**: Use setUp and tearDown for common initialization
   ```dart
   late Calculator calculator;
   
   setUp(() {
     calculator = Calculator();
   });
   
   tearDown(() {
     calculator.clear();
   });
   ```

5. **Test Independence**: Each test should be independent and not rely on others

6. **Edge Cases**: Always test boundary conditions and error cases

7. **Mock External Dependencies**: Use mockito for mocking external services

### Code Style

- Follow the Dart style guide
- Use `dart format` before committing
- Pass `flutter analyze` with no issues
- Use meaningful variable names
- Add comments for complex logic

### Pull Request Process

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Add/update tests
5. Run all tests and ensure they pass
6. Format code (`make format`)
7. Run analysis (`make analyze`)
8. Commit changes (`git commit -m 'Add amazing feature'`)
9. Push to branch (`git push origin feature/amazing-feature`)
10. Open a Pull Request

### PR Checklist

- [ ] Tests added/updated for all changes
- [ ] All tests pass locally
- [ ] Code formatted with `dart format`
- [ ] No analyzer warnings
- [ ] Documentation updated if needed
- [ ] Test coverage maintained/improved
- [ ] PR description clearly explains the changes

### Getting Help

If you have questions:
- Check the README.md for basic information
- Review existing tests for examples
- Open an issue for discussion

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Focus on the code, not the person
- Help others learn and grow

Thank you for contributing to make this project better!
