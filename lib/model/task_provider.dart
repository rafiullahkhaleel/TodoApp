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

  setDate(DateTime? getDate){
    if(getDate == null){
      return;
    }
    DateTime currentDate = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);

    int difference = getDate.difference(currentDate).inDays;

    if(difference == 0){
      date = 'Today';
    }else if (difference == 1){
      date = 'Tomorrow';
    }else if(difference == -1){
      date = 'Yesterday';
    }else{
      date = '${getDate.day} - ${getDate.month} - ${getDate.year}';
    }

    notifyListeners();
  }

  setTime(TimeOfDay? getTime){
    if(getTime==null){return;}

    if(getTime.hour == 0){
      time = '12:${getTime.minute} AM';
    }else if(getTime.hour > 0&& getTime.hour<12){
      time = '${getTime.hour} : ${getTime.minute} AM';
    }else if(getTime.hour == 12){
      time = '${getTime.hour} : ${getTime.minute} PM';
    }if(getTime.hour > 12){
      time = '${getTime.hour-12} : ${getTime.minute} PM';
    }
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