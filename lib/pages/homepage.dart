// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:todo/components/dailoguebox.dart';
import 'package:todo/components/todotile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List ToDoList = [
    ['Complete Assignment', false],
    ['Find Internship', false],
    ['Complete Linked Lists', false],
  ];

  final _controller = TextEditingController();

//check box function
  void saveNewTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        ToDoList.add([_controller.text, false]);
        _controller.clear();
        Navigator.pop(context);
      });
    }
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      ToDoList[index][1] = !ToDoList[index][1];
    });
  }

  void createNewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogueBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[500],
        title: const Text('TODO App',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: ToDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
                TaskName: ToDoList[index][0],
                Taskcompleted: ToDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewtask,
        backgroundColor: Colors.yellow[500],
        child: const Icon(Icons.add),
      ),
    );
  }
}
