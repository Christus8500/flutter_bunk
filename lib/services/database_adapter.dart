import "package:hive/hive.dart";

part 'database_adapter.g.dart';

@HiveType(typeId: 0)
class Password {
  @HiveField(0)
  String appName;

  @HiveField(1)
  String userName;

  @HiveField(2)
  String password;

  Password(this.appName, this.userName, this.password);
}
