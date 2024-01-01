import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/Model/Task.dart';

class tasklistClass extends ChangeNotifier {
  final _mybox = Hive.box('mybox');

  List tasklist = [];

  void addTask(String id, String title, DateTime? dateTime, bool isdone) {
    tasklist
        .add(Task(id: id, title: title, dateTime: dateTime, isdone: isdone));
    updateData();

    notifyListeners();
  }

  void removeTask(int index) {
    tasklist.removeAt(index);
    updateData();
    notifyListeners();
  }

  void okdone(int index, bool isdone) {
    tasklist.elementAt(index).isdone = isdone;
    updateData();
  }

  void createInitialData() {
    //First time opening app
    tasklist = [];
  }

  void loadData() {
    //Load from database
    tasklist = _mybox.get("TODOLIST");
  }

  void updateData() {
    //update the data base

    _mybox.put("TODOLIST", tasklist);

    //notifyListeners();
  }
}
