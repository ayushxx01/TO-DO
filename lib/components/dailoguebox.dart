// ignore_for_file: prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:todo/components/buttons.dart';

// ignore: must_be_immutable
class DialogueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogueBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter Task"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(text: "Save", onPressed: onSave),
                  const SizedBox(width: 10),
                  MyButton(text: "Cancel", onPressed: onCancel),
                ],
              )
            ],
          )),
    );
  }
}
