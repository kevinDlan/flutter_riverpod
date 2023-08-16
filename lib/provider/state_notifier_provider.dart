import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/models/clock.dart';
import 'package:river/models/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    const User(age: 10, name: 'kevin KONE'),
  ),
);

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) => Clock());
