import 'package:flutter/material.dart';
import 'package:todo_app/constants/constant.dart';

import '../widgets/custom widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              'Task',
              style: TextStyle(color: accent),
            ),
            subtitle: Text(
              'Tomorrow   02:00',
              style: TextStyle(color: accent),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
      floatingActionButton: CustomFloatingButton(),
    );
  }
}




