import 'package:flutter/material.dart';
import 'package:to_docheck/Todo.dart';
import '../task.dart';
class ToDoItem extends StatelessWidget {

  final task Task;
  final onchange;
  final ondeleteitem;




  const ToDoItem({Key? key,required this.Task,required this.onchange,required this.ondeleteitem});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(

              tileColor: Colors.white,
              onTap: () {
                onchange(Task);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              leading: Icon(
                Task.isdone? Icons.check_box : Icons.check_box_outline_blank,
                color: Colors.blue,
              ),
              title: Text(
                Task.todotext!,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: Task.isdone? TextDecoration.lineThrough: null),
              ),
              trailing: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5)),
                child: IconButton(
                    iconSize: 18,
                    color: Colors.white,
                    onPressed: () {
                      ondeleteitem(this.Task.id);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
