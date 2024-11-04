import 'package:flutter/material.dart';
import 'package:to_do/dialogbox.dart';
import 'package:to_do/todoapp.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller = TextEditingController();

  List todolist = [
    ['Make Tutorial', false],
    ['DO Exercise', false],
  ];

  void checkboxchanged(bool? value, int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void newtask() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialogbox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      todolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[50],
        appBar: AppBar(
          title: const Text("To Do"),
          backgroundColor: Colors.amber[300],
          elevation: 10,
          shadowColor: Colors.black,
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: newtask,
          backgroundColor: Colors.amber[200],
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: todolist.length,
            itemBuilder: (context, index) {
              return Todoapp(
                completed: todolist[index][1],
                onChanged: (value) => checkboxchanged(value, index),
                taskname: todolist[index][0],
                delete: (context) => deleteTask(index),
              );
            }));
  }
}
