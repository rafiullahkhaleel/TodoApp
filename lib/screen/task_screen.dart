import 'package:flutter/material.dart';
import 'package:todo_app/constants/constant.dart';

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

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return CustomDialog();
            });
      },
      shape: CircleBorder(),
      backgroundColor: primary,
      child: Icon(
        Icons.add,
        color: secondary,
        size: 40,
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Dialog(
      child: SizedBox(
        height: sh * .6,
        width: sw * .7,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sw * .05, vertical: sh * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text('New Task',
                    style: TextStyle(
                        color: accent,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                height: sh * .02,
              ),
              Text(
                'What has to be done',
                style: TextStyle(color: accent, fontSize: 15),
              ),
              SizedBox(
                height: sh * .02,
              ),
              SizedBox(
                height: 25,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter a Task',
                      hintStyle: TextStyle(color: Colors.black45)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
