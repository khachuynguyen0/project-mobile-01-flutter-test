/// A simple user model for demonstrating unit tests
class User {
  final String id;
  final String name;
  final String email;
  final int age;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
  });

  /// Validates if the user data is valid
  bool isValid() {
    return id.isNotEmpty &&
        name.isNotEmpty &&
        email.isNotEmpty &&
        email.contains('@') &&
        age > 0 &&
        age < 150;
  }

  /// Returns a display name for the user
  String getDisplayName() {
    return '$name (${age}y)';
  }

  /// Checks if the user is an adult
  bool isAdult() {
    return age >= 18;
  }

  /// Creates a copy of the user with updated fields
  User copyWith({
    String? id,
    String? name,
    String? email,
    int? age,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
    );
  }

  /// Converts user to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
    };
  }

  /// Creates a user from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      age: json['age'] as int,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.age == age;
  }

  @override
  int get hashCode {
    return Object.hash(id, name, email, age);
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, age: $age)';
  }
}
