import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_todo3/brain/task.dart';
import 'package:list_todo3/brain/user.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppViewBrain extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User('Youpi');

  String getTodayDate() {
    initializeDateFormatting('ja');
    return DateFormat.yMMMMEEEEd('ja').format(DateTime.now()).toString();
  }

  Color clrlvl1 = Colors.brown.shade50;
  Color clrlvl2 = Colors.brown.shade100;
  Color clrlvl3 = Colors.brown.shade400;
  Color clrlvl4 = Colors.brown.shade800;

  String get username => user.username;

  void deleteAllTask() {
    tasks.clear();
    notifyListeners();
  }

  void deleteCompletedTask() {
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  int get remainingTask => tasks.where((task) => !task.complete).length;

  int get numTasks => tasks.length;

  bool checked(int index) {
    return tasks[index].complete;
  }

  String taskTitle(int index) {
    return tasks[index].title;
  }

  String shareCheck = "";
  String check(value) {
    if (value == true) {
      shareCheck = '☑';
    } else {
      shareCheck = '☐';
    }
    return shareCheck;
  }

  String shareList = "";
  void createContentsForShare() {
    shareList = "";
    for (var i = 0; i < tasks.length; i++) {
      if (i != 0) {
        shareList += "\n";
      }
      shareList += ('${check(tasks[i].complete)} ${tasks[i].title}');
    }
  }

  void setValue(int index, bool taskValue) {
    tasks[index].complete = taskValue;
    notifyListeners();
  }

  void showBottomSheet(Widget bottomSheet, BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (context) {
        return bottomSheet;
      },
    );
  }

  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  void changeUser(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }
}
