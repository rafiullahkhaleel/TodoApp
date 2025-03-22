import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/constant.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/model/tast_provider.dart';

import '../widgets/custom widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    final taskPro = Provider.of<TaskProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'To Do List',
            style: TextStyle(color: secondary, fontWeight: FontWeight.w500),
          ),
          backgroundColor: primary,
          leading: Icon(
            Icons.check_circle,
            color: secondary,
            size: 32,
          )),
      body: Consumer<TaskProvider>(builder: (context,value,child){
        return ListView.separated(
          itemCount: value.taskList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(value.taskList[index].task,
                style: TextStyle(color: accent),
              ),
              subtitle: Text(
                '${value.taskList[index].date} / ${value.taskList[index].time}',
                style: TextStyle(color: accent),
              ),
              trailing: IconButton(
                  onPressed: (){
                    value.remove(index);
                  }, icon: Icon(Icons.delete_outline)),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        );
      }),
      floatingActionButton: CustomFloatingButton(),
    );
  }
}




