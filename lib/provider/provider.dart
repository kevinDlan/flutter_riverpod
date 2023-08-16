import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) => "kevin KONE");

final notificationStateProvider = StateProvider<int>((ref) => 0);
