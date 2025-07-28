import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List TodoList = [];

  final _myBox = Hive.box('todoBox');

  void createData() {
    TodoList = [
      ['Sample', false],
    ];
  }

  void loadData() {
    TodoList = _myBox.get('TODOLIST');
  }

  void updateDataBase() {
    _myBox.put('TODOLIST', TodoList);
  }
}
