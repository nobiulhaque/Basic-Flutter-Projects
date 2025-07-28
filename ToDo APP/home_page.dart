import 'package:brainstorm/database/database.dart';
import 'package:brainstorm/utils/dailog_box.dart';
import 'package:brainstorm/utils/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  TodoDatabase db = TodoDatabase();

  late Box _mybox;

  @override
  void initState() {
    super.initState();
    _mybox = Hive.box('todoBox');
    if (_mybox.get('TODOLIST') == null) {
      db.createData();
    } else {
      db.loadData();
    }
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.TodoList.removeAt(index);
      db.updateDataBase();
    });
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.TodoList[index][1] = !db.TodoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask(String task) {
    setState(() {
      db.TodoList.add([task, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () {
            saveNewTask(_controller.text);
          },

          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: const Text(
          'BrainStorm',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple[300],
        centerTitle: true,
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add, size: 30, color: Colors.deepPurple[300]),
      ),
      body: ListView.builder(
        itemCount: db.TodoList.length,
        itemBuilder: (context, index) {
          return TodoItem(
            isChecked: db.TodoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            todoText: db.TodoList[index][0],
            onPressed: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
