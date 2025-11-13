/// A simple calculator class for demonstrating unit tests
class Calculator {
  /// Adds two numbers
  int add(int a, int b) => a + b;

  /// Subtracts b from a
  int subtract(int a, int b) => a - b;

  /// Multiplies two numbers
  int multiply(int a, int b) => a * b;

  /// Divides a by b
  /// Throws [ArgumentError] if b is zero
  double divide(int a, int b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero');
    }
    return a / b;
  }

  /// Returns the factorial of n
  /// Throws [ArgumentError] if n is negative
  int factorial(int n) {
    if (n < 0) {
      throw ArgumentError('Factorial is not defined for negative numbers');
    }
    if (n == 0 || n == 1) {
      return 1;
    }
    return n * factorial(n - 1);
  }

  /// Checks if a number is prime
  bool isPrime(int n) {
    if (n < 2) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;

    for (int i = 3; i * i <= n; i += 2) {
      if (n % i == 0) return false;
    }
    return true;
  }
}
