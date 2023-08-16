import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

class Clock extends StateNotifier<DateTime> {
  late final Timer _timer;

  Clock() : super(DateTime.now()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
