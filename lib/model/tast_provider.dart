import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';

class TaskProvider extends ChangeNotifier{
  List<Task> taskList=[];

  String? task;
  String? date;
  String? time;

  setTask(String value){
    task = value;
    notifyListeners();
  }

  setDate(DateTime? value){
    date = value.toString();
    notifyListeners();
  }

  setTime(TimeOfDay? value){
    time = value.toString();
    notifyListeners();
  }

  addTask(){
    taskList.add(Task(task!, date!, time!));
    notifyListeners();
  }

  remove(int value){
    taskList.removeAt(value);
    notifyListeners();
  }

}