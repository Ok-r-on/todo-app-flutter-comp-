// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyDialogBox extends StatelessWidget {
  MyDialogBox({super.key, required this.controller, required this.onCancel, required this.onSaved});

  final controller;
  VoidCallback onCancel;
  VoidCallback onSaved;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Task"
              ),
            ),
            const SizedBox(width: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                ElevatedButton(
                  onPressed: onSaved, 
                  child: Text("Save",style: TextStyle(color: Colors.black),),                  
                ),
                //some spacing
                const SizedBox(width: 14,),
                //cancel button
                ElevatedButton(
                  onPressed: onCancel, 
                  child: Text("Cancel",style: TextStyle(color: Colors.black)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}