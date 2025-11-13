# Quick Start Guide

Get up and running with this Flutter test suite in minutes!

## Prerequisites

- Flutter SDK 3.0.0 or higher
- Dart SDK (included with Flutter)
- A code editor (VS Code, Android Studio, or IntelliJ IDEA)

## Installation

### 1. Install Flutter

If you haven't installed Flutter yet:

```bash
# macOS/Linux
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Verify installation
flutter doctor
```

For Windows and detailed instructions, visit: https://docs.flutter.dev/get-started/install

### 2. Clone the Repository

```bash
git clone <repository-url>
cd project-mobile-01-flutter-test
```

### 3. Install Dependencies

```bash
flutter pub get
```

## Running the App

```bash
# Run on connected device/emulator
flutter run

# Run on specific device
flutter devices
flutter run -d <device-id>

# Run on Chrome (web)
flutter run -d chrome
```

## Running Tests

### Quick Test Commands

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/calculator_test.dart

# Run with verbose output
flutter test --reporter=expanded

# Generate coverage report
flutter test --coverage
```

### Using Makefile (Recommended)

```bash
# Show all available commands
make help

# Install dependencies
make get

# Run all tests
make test

# Run only unit tests
make test-unit

# Run only widget tests
make test-widget

# Run integration tests
make test-integration

# Generate coverage report
make test-coverage

# Format code
make format

# Analyze code
make analyze

# Clean build artifacts
make clean
```

## Development Workflow

### 1. Start Development

```bash
# Pull latest changes
git pull origin main

# Create a new branch
git checkout -b feature/my-feature

# Install/update dependencies
make get
```

### 2. Make Changes

```bash
# Edit code in your favorite editor
code .

# Run tests continuously (in a separate terminal)
flutter test --watch
```

### 3. Test Your Changes

```bash
# Run all tests
make test

# Check code formatting
make format

# Run static analysis
make analyze

# Check test coverage
make test-coverage
```

### 4. Commit and Push

```bash
# Format code
make format

# Ensure tests pass
make test

# Stage changes
git add .

# Commit with descriptive message
git commit -m "Add amazing feature"

# Push to your branch
git push origin feature/my-feature
```

### 5. Create Pull Request

- Go to GitHub
- Click "New Pull Request"
- Select your branch
- Fill in the PR template
- Submit for review

## Project Structure

```
project-mobile-01-flutter-test/
├── lib/                      # Application code
│   ├── main.dart            # App entry point
│   ├── calculator.dart      # Calculator logic
│   ├── user.dart            # User model
│   └── user_service.dart    # User service
├── test/                     # Unit and widget tests
│   ├── calculator_test.dart
│   ├── user_test.dart
│   ├── user_service_test.dart
│   ├── widget_test.dart
│   └── test_helpers.dart
├── integration_test/         # Integration tests
│   └── app_test.dart
├── .github/workflows/        # CI/CD pipelines
│   └── test.yml
├── pubspec.yaml             # Dependencies
├── analysis_options.yaml    # Linter configuration
├── Makefile                 # Build automation
├── README.md                # Project overview
├── CONTRIBUTING.md          # Contribution guidelines
├── TEST_COVERAGE.md         # Test coverage details
└── QUICK_START.md           # This file
```

## Common Tasks

### Adding a New Feature

1. Write tests first (TDD):
   ```dart
   // test/my_feature_test.dart
   test('my feature works', () {
     final result = myFeature();
     expect(result, equals(expected));
   });
   ```

2. Implement the feature:
   ```dart
   // lib/my_feature.dart
   String myFeature() {
     return 'feature';
   }
   ```

3. Run tests:
   ```bash
   flutter test test/my_feature_test.dart
   ```

### Debugging Tests

```bash
# Run single test with verbose output
flutter test test/calculator_test.dart --reporter=expanded

# Run tests matching a name pattern
flutter test --plain-name "adds two numbers"

# Debug in VS Code
# 1. Open test file
# 2. Click "Debug" above the test
# 3. Use breakpoints
```

### Viewing Coverage

```bash
# Generate coverage
make test-coverage

# View in terminal (requires lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html

# Or use online tools
# Upload coverage/lcov.info to codecov.io
```

## Troubleshooting

### Tests Failing?

```bash
# Clean and rebuild
make clean
make get
make test
```

### Dependency Issues?

```bash
# Clear pub cache
flutter pub cache clean

# Get dependencies again
flutter pub get
```

### Flutter Issues?

```bash
# Check Flutter installation
flutter doctor -v

# Upgrade Flutter
flutter upgrade
```

## IDE Setup

### VS Code

1. Install extensions:
   - Flutter
   - Dart

2. Open Command Palette (Cmd/Ctrl+Shift+P)
   - "Flutter: New Project"

3. Enable format on save:
   - Settings → "Format On Save" → ✓

### Android Studio / IntelliJ

1. Install Flutter plugin
2. File → Settings → Languages & Frameworks → Flutter
3. Set Flutter SDK path
4. Enable format on save

## Learning Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Testing Guide](https://docs.flutter.dev/testing)
- [Widget Testing](https://docs.flutter.dev/cookbook/testing/widget/introduction)
- [Integration Testing](https://docs.flutter.dev/testing/integration-tests)

## Getting Help

- **Issues**: Check existing issues or create a new one
- **Discussions**: Join the discussions tab
- **Documentation**: Read README.md and CONTRIBUTING.md
- **Tests**: Look at existing tests for examples

## Next Steps

1. ✅ Install Flutter
2. ✅ Clone repository
3. ✅ Run `make get`
4. ✅ Run `make test`
5. ✅ Run `flutter run`
6. 🎉 Start developing!

Happy coding! 🚀
