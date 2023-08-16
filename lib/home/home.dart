import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/notification/screens/notification_list_screen.dart';
import 'package:river/provider/provider.dart';
// import 'package:river/models/user.dart';
// import 'package:river/provider/change_notifier_provider.dart';
// import 'package:river/provider/provider.dart';
// import 'package:river/provider/state_provider.dart';
import '../provider/state_notifier_provider.dart';
import 'package:intl/intl.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeConsumerState();
}

class _HomeConsumerState extends ConsumerState<Home> {
  void onSubmit(WidgetRef ref, int value) {
    // ref.read(ageProvider.notifier).update((state) => value);
    ref.read(userProvider.notifier).updateAge(value);
  }

  void setUserName(String name) {
    ref.read(userProvider.notifier).updateName(name);
  }

  void addNotif() {
    ref.read(notificationStateProvider.notifier).state++;
  }

  void reduiceNotif() {
    ref.read(notificationStateProvider.notifier).state--;
  }

  @override
  Widget build(BuildContext context) {
    // final String name = ref.watch(nameProvider);
    // final int age = ref.watch(ageProvider);
    // final user = ref.watch(userProvider.select((value) => value.age));
    // final user = ref.watch(userProvider);

    // final userChangeNotifier = ref.watch(userChangeNotifierProvider).user;

    final int notif = ref.watch(notificationStateProvider);
    final String currentDatTime =
        DateFormat.Hms().format(ref.watch(clockProvider));

    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text('River Pod'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const Icon(
                  Icons.notifications,
                  size: 30,
                ),
                Positioned(
                  top: 12,
                  left: 16,
                  child: Container(
                    height: 13,
                    width: 13,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    child: Center(
                      child: Text(
                        notif.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => addNotif(),
                child: const Text('Add Notif'),
              ),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: () => reduiceNotif(),
                child: const Text('Reduice Notif'),
              ),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationListScreen())),
                child: const Text('new'),
              ),
            ],
          ),
          Text(
            currentDatTime,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          const Stack(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xff6a7175),
                backgroundImage: AssetImage("assets/images/profil_bg.png"),
                radius: 50,
              ),
              Positioned(
                top: 50,
                left: 50,
                child: Image(
                  width: 65,
                  height: 65,
                  fit: BoxFit.contain,
                  image: AssetImage(
                    'assets/images/certified_badge.png',
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
