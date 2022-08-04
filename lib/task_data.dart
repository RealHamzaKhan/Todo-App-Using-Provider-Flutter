import 'package:flutter/material.dart';
import 'package:watodo/task.dart';
class TaskData extends ChangeNotifier{
  late String taskName;
  List<Task> tasks=[
    Task(name: 'Eat Bread'),
    Task(name: 'Eat banana'),
    Task(name: 'Go to gym'),
  ];
  void addTask()
  {
    String newTask=taskName;
    tasks.add(Task(name: newTask));
    notifyListeners();
  }
  void removeTask(int index)
  {
    tasks.removeAt(index);
    notifyListeners();
  }

}