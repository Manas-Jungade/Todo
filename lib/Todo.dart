import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:to_docheck/Todo_item.dart';
import '../task.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final todoList = task.taskList();
  final TodoController=TextEditingController();

  List<task> found=[];
  @override
  void initState() {
    // TODO: implement initState
    found=todoList;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("To Do",style: TextStyle(color: Colors.greenAccent,fontSize: 40),),

          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                padding: const EdgeInsets.only(top: 0,),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey,
                      child: Container(

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),

                        child: TextField(
                          showCursor: true,


                          onChanged: (value) => Search(value),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2.5),borderRadius: BorderRadius.circular(20)),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 20,
                              ),
                              hintText: "Search",
                              border: InputBorder.none),
                        ),
                      ),
                    ),


                    Expanded(
                      child: ListView(

                        controller: ScrollController(keepScrollOffset: false),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              child: Text(
                                "To Do Work",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),

                         for(task Tasks in found.reversed)
                           ToDoItem(
                             Task: Tasks,
                             onchange:  HandleTodochange,
                             ondeleteitem: onDelete,

                           ),

                        ],
                      ),

                    ),


                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 0.1
                        )]
                      ),
                      child: TextField(
                        controller: TodoController,


                        decoration: InputDecoration(
                         focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black,width: 1)),

                          hintText: "     Add a new To Do Item",
                          border: InputBorder.none,


                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20,right: 20),
                  child:
                     ElevatedButton(

                      style:ElevatedButton.styleFrom(surfaceTintColor: Colors.black,elevation: 20,shadowColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        onPressed: (){
                        Add(TodoController.text);
                        }, child: Text("+",style: TextStyle(fontSize: 40),)),

                    
                  ),

              ],
            ),
          )
        ],
      ),
    );
  }
  void HandleTodochange(task Task){
    setState(() {
      Task.isdone=!Task.isdone;
    });

  }
  void onDelete(String id){
    setState(() {
      todoList.removeWhere((element) => element.id==id);
    });

  }
  void Add(String todo){
    setState(() {
      todoList.add(task(id: DateTime.now().microsecondsSinceEpoch.toString(), todotext: todo));
    });
    TodoController.clear();

  }
  void Search(String searchedval){
    List<task> result=[];
    if(searchedval.isEmpty){
      result=todoList;
    }
    else{
      result=todoList.where((element) => element.todotext!.toLowerCase().contains(searchedval.toLowerCase())).toList();
    }

    setState(() {
      found=result;
    });
  }
}
