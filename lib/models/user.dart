import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class User {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, age: $age)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super._state);

  void updateName(String userName) {
    state = state.copyWith(name: userName);
  }

  void updateAge(int userAge) {
    state = state.copyWith(age: userAge);
  }
}

class UserChangeNotifier extends ChangeNotifier {
  User user = const User(age: 0, name: 'kevin KONE');

  void updateName(String userName) {
    user = user.copyWith(name: userName);
    notifyListeners();
  }

  void updateAge(int userAge) {
    user = user.copyWith(age: userAge);
    notifyListeners();
  }
}
