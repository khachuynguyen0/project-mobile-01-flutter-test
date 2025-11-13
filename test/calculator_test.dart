import 'package:flutter_test/flutter_test.dart';
import 'package:project_mobile_01_flutter_test/calculator.dart';

void main() {
  group('Calculator', () {
    late Calculator calculator;

    setUp(() {
      calculator = Calculator();
    });

    group('add', () {
      test('adds two positive numbers', () {
        expect(calculator.add(2, 3), equals(5));
      });

      test('adds two negative numbers', () {
        expect(calculator.add(-2, -3), equals(-5));
      });

      test('adds positive and negative numbers', () {
        expect(calculator.add(5, -3), equals(2));
        expect(calculator.add(-5, 3), equals(-2));
      });

      test('adds zero to a number', () {
        expect(calculator.add(5, 0), equals(5));
        expect(calculator.add(0, 5), equals(5));
      });
    });

    group('subtract', () {
      test('subtracts two positive numbers', () {
        expect(calculator.subtract(5, 3), equals(2));
      });

      test('subtracts resulting in negative', () {
        expect(calculator.subtract(3, 5), equals(-2));
      });

      test('subtracts zero', () {
        expect(calculator.subtract(5, 0), equals(5));
      });

      test('subtracts from zero', () {
        expect(calculator.subtract(0, 5), equals(-5));
      });
    });

    group('multiply', () {
      test('multiplies two positive numbers', () {
        expect(calculator.multiply(3, 4), equals(12));
      });

      test('multiplies by zero', () {
        expect(calculator.multiply(5, 0), equals(0));
        expect(calculator.multiply(0, 5), equals(0));
      });

      test('multiplies negative numbers', () {
        expect(calculator.multiply(-3, 4), equals(-12));
        expect(calculator.multiply(3, -4), equals(-12));
        expect(calculator.multiply(-3, -4), equals(12));
      });

      test('multiplies by one', () {
        expect(calculator.multiply(5, 1), equals(5));
        expect(calculator.multiply(1, 5), equals(5));
      });
    });

    group('divide', () {
      test('divides two positive numbers', () {
        expect(calculator.divide(10, 2), equals(5.0));
      });

      test('divides resulting in decimal', () {
        expect(calculator.divide(10, 3), closeTo(3.333, 0.001));
      });

      test('divides negative numbers', () {
        expect(calculator.divide(-10, 2), equals(-5.0));
        expect(calculator.divide(10, -2), equals(-5.0));
        expect(calculator.divide(-10, -2), equals(5.0));
      });

      test('throws error when dividing by zero', () {
        expect(
          () => calculator.divide(10, 0),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    group('factorial', () {
      test('calculates factorial of zero', () {
        expect(calculator.factorial(0), equals(1));
      });

      test('calculates factorial of one', () {
        expect(calculator.factorial(1), equals(1));
      });

      test('calculates factorial of positive numbers', () {
        expect(calculator.factorial(5), equals(120));
        expect(calculator.factorial(3), equals(6));
        expect(calculator.factorial(4), equals(24));
      });

      test('throws error for negative numbers', () {
        expect(
          () => calculator.factorial(-1),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    group('isPrime', () {
      test('identifies prime numbers', () {
        expect(calculator.isPrime(2), isTrue);
        expect(calculator.isPrime(3), isTrue);
        expect(calculator.isPrime(5), isTrue);
        expect(calculator.isPrime(7), isTrue);
        expect(calculator.isPrime(11), isTrue);
        expect(calculator.isPrime(13), isTrue);
      });

      test('identifies non-prime numbers', () {
        expect(calculator.isPrime(0), isFalse);
        expect(calculator.isPrime(1), isFalse);
        expect(calculator.isPrime(4), isFalse);
        expect(calculator.isPrime(6), isFalse);
        expect(calculator.isPrime(8), isFalse);
        expect(calculator.isPrime(9), isFalse);
        expect(calculator.isPrime(10), isFalse);
      });

      test('identifies negative numbers as non-prime', () {
        expect(calculator.isPrime(-2), isFalse);
        expect(calculator.isPrime(-5), isFalse);
      });
    });
  });
}
