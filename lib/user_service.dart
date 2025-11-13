/// A service class for demonstrating mockito tests
class UserService {
  final List<String> _users = [];

  /// Adds a user to the service
  void addUser(String username) {
    if (username.isEmpty) {
      throw ArgumentError('Username cannot be empty');
    }
    if (_users.contains(username)) {
      throw StateError('User already exists');
    }
    _users.add(username);
  }

  /// Removes a user from the service
  bool removeUser(String username) {
    return _users.remove(username);
  }

  /// Gets all users
  List<String> getAllUsers() {
    return List.unmodifiable(_users);
  }

  /// Checks if a user exists
  bool hasUser(String username) {
    return _users.contains(username);
  }

  /// Gets the count of users
  int getUserCount() {
    return _users.length;
  }

  /// Clears all users
  void clear() {
    _users.clear();
  }
}
