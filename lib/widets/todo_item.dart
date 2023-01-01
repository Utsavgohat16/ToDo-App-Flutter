import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo toDo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem({ Key? key ,required this.toDo,required this.onDeleteItem,required this.onToDoChanged }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          //print('Clicked on ToDo item');
          onToDoChanged(toDo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank         
        ),
        title: Text(toDo.todoText!, style: TextStyle(fontSize:16,color: tdBlack,decoration: toDo.isDone? TextDecoration.lineThrough : null ,) ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.only(right: 6),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon:Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(toDo.id);
              //print('Clicked on delete item');
            },
          ),
        ),

        
      ),
      
    );
  }
}