import 'package:hive/hive.dart';

class MyDataBase {

  final _mybox = Hive.box('myBox');

  List todolists=[];

  //create these tasks the first time the app runs
  void createInitialData(){
    todolists = [
      ["Task 1",false],
      ["Task 2",false]
    ];
  }

  //update the said db
  void updateDatabase(){
    _mybox.put("TODOLIST", todolists);
  }

  //load the data
  void loadData(){
    todolists = _mybox.get('TODOLIST');
  }
}