// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String TaskName;
  final bool Taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.TaskName,
      required this.Taskcompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              foregroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.yellow[500],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(TaskName,
                        style: TextStyle(
                          decoration: Taskcompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        )),
                  ),
                  Checkbox(
                    activeColor: Colors.black,
                    value: Taskcompleted,
                    onChanged: onChanged,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
