import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/models/user.dart';

final userChangeNotifierProvider =
    ChangeNotifierProvider((ref) => UserChangeNotifier());
