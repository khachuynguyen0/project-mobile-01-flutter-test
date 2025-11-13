# Flutter Test Suite Project

A comprehensive Flutter project demonstrating best practices for testing, including unit tests, widget tests, and integration tests.

## Project Structure

```
├── lib/
│   ├── main.dart              # Main application with counter functionality
│   ├── calculator.dart        # Calculator class for unit testing
│   ├── user.dart              # User model with validation
│   └── user_service.dart      # User service for service testing
├── test/
│   ├── calculator_test.dart   # Unit tests for Calculator
│   ├── user_test.dart         # Unit tests for User model
│   ├── user_service_test.dart # Unit tests for UserService
│   └── widget_test.dart       # Widget tests for main app
└── integration_test/
    └── app_test.dart          # End-to-end integration tests
```

## Features

- **Counter App**: Interactive counter with increment, decrement, and reset functionality
- **Calculator**: Mathematical operations with comprehensive test coverage
- **User Model**: Data model with validation and JSON serialization
- **User Service**: Service layer demonstrating state management

## Testing

This project includes three types of tests:

### Unit Tests

Tests for business logic and utility functions:

```bash
flutter test test/calculator_test.dart
flutter test test/user_test.dart
flutter test test/user_service_test.dart
```

### Widget Tests

Tests for UI components and interactions:

```bash
flutter test test/widget_test.dart
```

### Integration Tests

End-to-end tests for complete user flows:

```bash
flutter test integration_test/app_test.dart
```

### Run All Tests

To run all tests at once:

```bash
flutter test
```

## Test Coverage

The test suite includes:

- **Calculator Tests**: 40+ test cases covering arithmetic operations, edge cases, and error handling
- **User Tests**: 30+ test cases for validation, serialization, and data integrity
- **User Service Tests**: 25+ test cases for service operations and state management
- **Widget Tests**: 15+ test cases for UI interactions and component behavior
- **Integration Tests**: 5 end-to-end test scenarios

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (included with Flutter)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd project-mobile-01-flutter-test
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

4. Run tests:
```bash
flutter test
```

## Test Best Practices Demonstrated

1. **Arrange-Act-Assert Pattern**: Clear test structure for readability
2. **Setup and Teardown**: Proper test initialization and cleanup
3. **Test Groups**: Organized test suites by functionality
4. **Edge Case Testing**: Coverage of boundary conditions and error cases
5. **Widget Keys**: Strategic use of keys for reliable widget testing
6. **Integration Testing**: End-to-end user flow validation
7. **Mocking**: Ready for service mocking with mockito

## Continuous Integration

This project is configured to run tests automatically in CI/CD pipelines. All tests must pass before merging changes.

## Contributing

When adding new features:
1. Write tests first (TDD approach)
2. Ensure all existing tests pass
3. Maintain test coverage above 80%
4. Follow the existing test patterns

## License

This project is for educational and demonstration purposes.
