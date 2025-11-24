import 'package:flutter/material.dart';
import '../components/todo_tile.dart';
import '../components/dialog_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _controller = TextEditingController();

  //creamos una lista para mostrar
  List taskList = [
    ["Dar clases", false],
    ["Comprar cena", false],
    ["Lavar carro", false]
  ];

  //metodo para cambiar el estado del checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }

  //guardar nueva tarea
  void saveNewTask() {
    setState(() {
      taskList.add([_controller.text, false]);
    });
    Navigator.pop(context);
    _controller.clear();
  }

  //abrir dialogo
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () {
              Navigator.pop(context);
              _controller.clear();
            },
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dark_mode_outlined, size: 40),
          )
        ],
        title: const Text("TodoApp"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor.withAlpha(120),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: taskList[index][0],
            taskCompleted: taskList[index][1],
            onChanged: (value) {
              checkBoxChanged(value, index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
