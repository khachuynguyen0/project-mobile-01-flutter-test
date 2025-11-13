import 'package:flutter_test/flutter_test.dart';
import 'package:project_mobile_01_flutter_test/user_service.dart';

void main() {
  group('UserService', () {
    late UserService userService;

    setUp(() {
      userService = UserService();
    });

    tearDown(() {
      userService.clear();
    });

    group('addUser', () {
      test('adds a user successfully', () {
        userService.addUser('john_doe');
        
        expect(userService.hasUser('john_doe'), isTrue);
        expect(userService.getUserCount(), equals(1));
      });

      test('adds multiple users', () {
        userService.addUser('john_doe');
        userService.addUser('jane_doe');
        userService.addUser('bob_smith');

        expect(userService.getUserCount(), equals(3));
        expect(userService.hasUser('john_doe'), isTrue);
        expect(userService.hasUser('jane_doe'), isTrue);
        expect(userService.hasUser('bob_smith'), isTrue);
      });

      test('throws error when adding empty username', () {
        expect(
          () => userService.addUser(''),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('throws error when adding duplicate user', () {
        userService.addUser('john_doe');
        
        expect(
          () => userService.addUser('john_doe'),
          throwsA(isA<StateError>()),
        );
      });
    });

    group('removeUser', () {
      test('removes an existing user', () {
        userService.addUser('john_doe');
        
        final removed = userService.removeUser('john_doe');
        
        expect(removed, isTrue);
        expect(userService.hasUser('john_doe'), isFalse);
        expect(userService.getUserCount(), equals(0));
      });

      test('returns false when removing non-existent user', () {
        final removed = userService.removeUser('non_existent');
        
        expect(removed, isFalse);
      });

      test('removes correct user from multiple users', () {
        userService.addUser('john_doe');
        userService.addUser('jane_doe');
        userService.addUser('bob_smith');

        userService.removeUser('jane_doe');

        expect(userService.getUserCount(), equals(2));
        expect(userService.hasUser('john_doe'), isTrue);
        expect(userService.hasUser('jane_doe'), isFalse);
        expect(userService.hasUser('bob_smith'), isTrue);
      });
    });

    group('getAllUsers', () {
      test('returns empty list when no users', () {
        final users = userService.getAllUsers();
        
        expect(users, isEmpty);
      });

      test('returns all users', () {
        userService.addUser('john_doe');
        userService.addUser('jane_doe');
        userService.addUser('bob_smith');

        final users = userService.getAllUsers();

        expect(users, hasLength(3));
        expect(users, contains('john_doe'));
        expect(users, contains('jane_doe'));
        expect(users, contains('bob_smith'));
      });

      test('returns unmodifiable list', () {
        userService.addUser('john_doe');
        
        final users = userService.getAllUsers();
        
        expect(
          () => users.add('jane_doe'),
          throwsUnsupportedError,
        );
      });
    });

    group('hasUser', () {
      test('returns true for existing user', () {
        userService.addUser('john_doe');
        
        expect(userService.hasUser('john_doe'), isTrue);
      });

      test('returns false for non-existent user', () {
        expect(userService.hasUser('non_existent'), isFalse);
      });

      test('returns false after user is removed', () {
        userService.addUser('john_doe');
        userService.removeUser('john_doe');
        
        expect(userService.hasUser('john_doe'), isFalse);
      });
    });

    group('getUserCount', () {
      test('returns 0 for empty service', () {
        expect(userService.getUserCount(), equals(0));
      });

      test('returns correct count after adding users', () {
        userService.addUser('john_doe');
        expect(userService.getUserCount(), equals(1));

        userService.addUser('jane_doe');
        expect(userService.getUserCount(), equals(2));

        userService.addUser('bob_smith');
        expect(userService.getUserCount(), equals(3));
      });

      test('returns correct count after removing users', () {
        userService.addUser('john_doe');
        userService.addUser('jane_doe');
        userService.addUser('bob_smith');

        userService.removeUser('jane_doe');
        expect(userService.getUserCount(), equals(2));

        userService.removeUser('john_doe');
        expect(userService.getUserCount(), equals(1));
      });
    });

    group('clear', () {
      test('removes all users', () {
        userService.addUser('john_doe');
        userService.addUser('jane_doe');
        userService.addUser('bob_smith');

        userService.clear();

        expect(userService.getUserCount(), equals(0));
        expect(userService.getAllUsers(), isEmpty);
      });

      test('allows adding users after clear', () {
        userService.addUser('john_doe');
        userService.clear();
        userService.addUser('jane_doe');

        expect(userService.getUserCount(), equals(1));
        expect(userService.hasUser('jane_doe'), isTrue);
      });
    });
  });
}
