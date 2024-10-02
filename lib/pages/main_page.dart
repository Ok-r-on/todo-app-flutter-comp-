// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialogbox.dart';
import 'package:todo_app/utils/todotiles.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  MyDataBase db = MyDataBase();
  //referencing the box
  final _mybox = Hive.box('myBox');

  final _mycontroller = TextEditingController();

  @override
  void initState() {
    
    if(_mybox.get("TODOLIST") == null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }

    super.initState();
  }

  //checkbox got tapped
  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.todolists[index][1]=!db.todolists[index][1];
    });
    db.updateDatabase();
  }

  //function to add task to  list
  void AddTask(){
    setState(() {
    db.todolists.add([_mycontroller.text,false]);
    _mycontroller.clear();
    });
    db.updateDatabase();
    Navigator.of(context).pop();
  }

  //function to create new task
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return MyDialogBox(
        controller: _mycontroller,
        onCancel: () => Navigator.of(context).pop(),
        onSaved: AddTask,
      );
    });
  }

  //function to delete task
  void DeleteTask(int index){
    setState(() {
      db.todolists.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("T o - D o ")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todolists.length,
        itemBuilder: (context, index) {
          return ToDoTiles(
            TaskName: db.todolists[index][0],
            taskCompleted: db.todolists[index][1],
            onChanged:(value) => checkBoxChanged(value,index),
            deleteTask: (p0) => DeleteTask(index),
          );
        },
      )
    );
  }
}