import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/data/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //crear controlador para pasarle al DialogBox
  final _controller = TextEditingController();

  //creamos una instancia de la clase database
  DataBase db = DataBase();
  //referenciamos nuestro box
  final _mybox = Hive.box('mybox');

  //creamos una lista para mostrar
  // final List taskList = [
  //   ["Dar Clases", false],
  //   ["Comprar Cena", false],
  // ];

  //Metodo para cambiar el estado del checkbox
  void checkBoxChange(bool? value, int index){
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });

    db.updateData();
  }

  //metodo para crear nueva tarea
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: (){
            Navigator.pop(context);
            _controller.clear();
          },
          onSave: saveNewTask,
        );
      },
    );
  }

  //metodo para salvar una nueva tarea
  void saveNewTask(){
    setState(() {
      db.todoList.add([_controller.text, false]);
      Navigator.pop(context);
      _controller.clear();
    });
    db.updateData();
  }

  @override
  void initState() {
    // TODO: implement initState
    //validar si no se ha agreagado data
    if(_mybox.get("TODOLIST") == null){
      db.createInitialData();
    }
    else
    {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.dark_mode_outlined, size: 40,))],
        title: Text("TodoApp"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor.withAlpha(120),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value){
                //ejecutar codigo para marcar o desmarcar el checkbox
                checkBoxChange(value, index);
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}