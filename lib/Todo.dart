import 'package:flutter/material.dart';
import '../model.dart';

class toDo extends StatelessWidget {
  final Test todo;
  final OnToDochanged;
  final OnDeletechanged;
  const toDo(
      {Key? key,
      required this.todo,
      required this.OnToDochanged,
      required this.OnDeletechanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 23),
        child: ListTile(
          onTap: () {
            // print('Clicked on a todo item');
            OnToDochanged(todo);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 5, color: Colors.green)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.pink,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.orange,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                decoration: todo.isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              onPressed: () {
                // print('Clicked on delete button');
                OnDeletechanged(todo.id);
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
              iconSize: 22,
            ),
          ),
        ));
  }
}
