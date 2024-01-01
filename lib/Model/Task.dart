import 'package:hive_flutter/hive_flutter.dart';
part 'Task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  DateTime? dateTime;

  @HiveField(3)
  bool? isdone;

  Task({this.id, this.title, this.dateTime, this.isdone});
}
