import 'package:to_docheck/Todo.dart';

class task{
  String? id;
  String? todotext;
  bool isdone;
  task({
    required this.id,
    required this.todotext,
    this.isdone=false

});
  static List<task> taskList(){
  return[
    task(id:'01',todotext:"Good Morning",isdone:true),
    task(id:'02',todotext:"Good night",isdone:true),
    task(id:'03',todotext:"Good day",),
    task(id:'04',todotext:"Good job",),
    task(id:'05',todotext:"meet",),
    task(id:'06',todotext:"Good afternoon",),
    task(id:'07',todotext:"work",isdone:true),
    task(id:'08',todotext:"exercise",isdone:true),

  ];
  }

}