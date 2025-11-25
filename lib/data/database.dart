import 'package:hive/hive.dart';

class DataBase {

  List todoList = [];

  //referenciar un box
final _myBox = Hive.box("mybox");

//si abrimos la app por primera vez
void createInitialData(){
  todoList = [
    ["Task 1", false],
    ["Task 2", false],
    ["Task 3", false]
  ];
}

//leer la lista
void loadData(){
  todoList = _myBox.get("TODOLIST");
}

//actualizar la lista
void updateData(){
  _myBox.put("TODOLIST", todoList);
}

}