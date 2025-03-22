import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_provider.dart';

import '../../constants/constant.dart';
import '../screen/task_screen.dart';

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

class CustomDialog extends StatefulWidget {
  CustomDialog({
    super.key,
  });

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context,listen: false);
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Dialog(
      child: SizedBox(
        height: sh * .52,
        width: sw * .7,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sw * .05, vertical: sh * .02),
          child: SingleChildScrollView(
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
                  height: sh * .015,
                ),
                CustomField(
                  onchange: (value){
                    taskProvider.setTask(value);
                  },
                  hint: 'Enter a Task',
                ),
                SizedBox(
                  height: sh * .07,
                ),
                Text(
                  'Due Date',
                  style: TextStyle(color: accent, fontSize: 15),
                ),
                SizedBox(
                  height: sh * .012,
                ),
                CustomField(
                  readOnly: true,
                  hint: 'Enter a Date',
                  iconButton: IconButton(
                      onPressed: () async {
                       DateTime? date =  await showDatePicker(
                            context: context,
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2030));
                        taskProvider.setDate(date);
                      },
                      icon: Icon(Icons.date_range)),
                ),
                SizedBox(
                  height: sh * .015,
                ),
                CustomField(
                  hint: 'Enter a Time',
                  iconButton: IconButton(
                      onPressed: () async {
                        TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now());
                        taskProvider.setTime(time);
                      },
                      icon: Icon(Icons.timer)),
                ),
                SizedBox(
                  height: sh * .02,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () {
                        taskProvider.addTask();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: accent),
                      child: Text(
                        'Create',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  final String hint;
  final IconButton? iconButton;
  final bool readOnly;
  final ValueChanged? onchange;
  const CustomField({
    super.key,
    required this.hint,
    this.iconButton,
    this.readOnly = false,
    this.onchange
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchange,
      readOnly: readOnly,
      decoration: InputDecoration(
          suffixIcon: iconButton,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black45)),
    );
  }
}
