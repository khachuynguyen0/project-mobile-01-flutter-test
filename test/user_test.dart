import 'package:flutter_test/flutter_test.dart';
import 'package:project_mobile_01_flutter_test/user.dart';

void main() {
  group('User', () {
    group('constructor', () {
      test('creates a user with all required fields', () {
        const user = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 30,
        );

        expect(user.id, equals('1'));
        expect(user.name, equals('John Doe'));
        expect(user.email, equals('john@example.com'));
        expect(user.age, equals(30));
      });
    });

    group('isValid', () {
      test('returns true for valid user', () {
        const user = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 30,
        );

        expect(user.isValid(), isTrue);
      });

      test('returns false for empty id', () {
        const user = User(
          id: '',
          name: 'John Doe',
          email: 'john@example.com',
          age: 30,
        );

        expect(user.isValid(), isFalse);
      });

      test('returns false for empty name', () {
        const user = User(
          id: '1',
          name: '',
          email: 'john@example.com',
          age: 30,
        );

        expect(user.isValid(), isFalse);
      });

      test('returns false for invalid email', () {
        const user1 = User(
          id: '1',
          name: 'John Doe',
          email: '',
          age: 30,
        );

        const user2 = User(
          id: '1',
          name: 'John Doe',
          email: 'invalid-email',
          age: 30,
        );

        expect(user1.isValid(), isFalse);
        expect(user2.isValid(), isFalse);
      });

      test('returns false for invalid age', () {
        const user1 = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 0,
        );

        const user2 = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: -5,
        );

        const user3 = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 150,
        );

        expect(user1.isValid(), isFalse);
        expect(user2.isValid(), isFalse);
        expect(user3.isValid(), isFalse);
      });
    });

    group('getDisplayName', () {
      test('returns formatted display name', () {
        const user = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 30,
        );

        expect(user.getDisplayName(), equals('John Doe (30y)'));
      });
    });

    group('isAdult', () {
      test('returns true for age 18 and above', () {
        const user1 = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 18,
        );

        const user2 = User(
          id: '2',
          name: 'Jane Doe',
          email: 'jane@example.com',
          age: 25,
        );

        expect(user1.isAdult(), isTrue);
        expect(user2.isAdult(), isTrue);
      });

      test('returns false for age below 18', () {
        const user = User(
          id: '1',
          name: 'Young User',
          email: 'young@example.com',
          age: 17,
        );

        expect(user.isAdult(), isFalse);
      });
    });

    group('copyWith', () {
      test('creates a copy with updated fields', () {
        const user = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 30,
        );

        final updatedUser = user.copyWith(name: 'Jane Doe', age: 25);

        expect(updatedUser.id, equals('1'));
        expect(updatedUser.name, equals('Jane Doe'));
        expect(updatedUser.email, equals('john@example.com'));
        expect(updatedUser.age, equals(25));
      });

      test('creates a copy with no changes when no parameters provided', () {
        const user = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 30,
        );

        final copiedUser = user.copyWith();

        expect(copiedUser.id, equals(user.id));
        expect(copiedUser.name, equals(user.name));
        expect(copiedUser.email, equals(user.email));
        expect(copiedUser.age, equals(user.age));
      });
    });

    group('JSON serialization', () {
      test('toJson converts user to map', () {
        const user = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 30,
        );

        final json = user.toJson();

        expect(json, equals({
          'id': '1',
          'name': 'John Doe',
          'email': 'john@example.com',
          'age': 30,
        }));
      });

      test('fromJson creates user from map', () {
        final json = {
          'id': '1',
          'name': 'John Doe',
          'email': 'john@example.com',
          'age': 30,
        };

        final user = User.fromJson(json);

        expect(user.id, equals('1'));
        expect(user.name, equals('John Doe'));
        expect(user.email, equals('john@example.com'));
        expect(user.age, equals(30));
      });

      test('round trip JSON serialization', () {
        const user = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 30,
        );

        final json = user.toJson();
        final deserializedUser = User.fromJson(json);

        expect(deserializedUser, equals(user));
      });
    });

    group('equality', () {
      test('users with same values are equal', () {
        const user1 = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 30,
        );

        const user2 = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 30,
        );

        expect(user1, equals(user2));
        expect(user1.hashCode, equals(user2.hashCode));
      });

      test('users with different values are not equal', () {
        const user1 = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 30,
        );

        const user2 = User(
          id: '2',
          name: 'Jane Doe',
          email: 'jane@example.com',
          age: 25,
        );

        expect(user1, isNot(equals(user2)));
      });
    });

    group('toString', () {
      test('returns string representation', () {
        const user = User(
          id: '1',
          name: 'John Doe',
          email: 'john@example.com',
          age: 30,
        );

        expect(
          user.toString(),
          equals('User(id: 1, name: John Doe, email: john@example.com, age: 30)'),
        );
      });
    });
  });
}
