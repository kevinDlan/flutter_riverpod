import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/provider/provider.dart';

class NotificationListScreen extends StatelessWidget {
  const NotificationListScreen({super.key});

  void onPressed(WidgetRef ref) {
    ref.read(notificationStateProvider.notifier).state++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: Consumer(builder: (_, WidgetRef ref, __) {
        return Column(
          children: [
            Center(
                child: ElevatedButton(
              onPressed: () => onPressed(ref),
              child: const Text('Change Nptif'),
            ))
          ],
        );
      }),
    );
  }
}
