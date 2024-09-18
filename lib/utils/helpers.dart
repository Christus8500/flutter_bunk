import 'package:bunk/services/database_adapter.dart';
import 'package:hive_flutter/hive_flutter.dart';

void savePassword(
    {required String appName,
    required String userName,
    required String password}) {
  final box = Hive.box<Password>('password');

  box.add(Password(appName, userName, password));
}
