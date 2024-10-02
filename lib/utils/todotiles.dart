// ignore_for_file: must_be_immutable, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTiles extends StatelessWidget {
  ToDoTiles({super.key, 
    required this.TaskName, 
    required this.onChanged, 
    required this.taskCompleted,
    required this.deleteTask
  });

  final String TaskName;
  final bool taskCompleted;
  Function (bool?)? onChanged;
  Function (BuildContext?)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15,top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
            )
          ]
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.yellow, 
          borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                TaskName,
                style: TextStyle(
                  decoration: taskCompleted ?
                  TextDecoration.lineThrough :
                  TextDecoration.none
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}