import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckBox(
        checkBoxState: isChecked,
        toggleCheckboxState: (bool checkboxState) {
          setState(() {
            isChecked = checkboxState;
          });
        },
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  TaskCheckBox({this.checkBoxState, this.toggleCheckboxState});
  final bool checkBoxState;
  final Function toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkBoxState,
      activeColor: Colors.lightBlueAccent,
      onChanged: toggleCheckboxState,
    );
  }
}
