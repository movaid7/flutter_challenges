import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('To Do List App')),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 160, 203),
                borderRadius: BorderRadius.all(Radius.circular(25)),
                border: Border.all(color: const Color.fromARGB(255, 244, 159, 201), width: 7),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 252, 196, 217),
                    offset: Offset(2, 2),
                    spreadRadius: 10,
                    blurRadius: 20,
                  )
                ],
              ),
              width: 600,
              height: 100,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(20.0),
              child: const Text(
                'What needs to be done Today?',
                style: TextStyle(
                  color: Color.fromARGB(255, 252, 236, 242),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(child: TodoList()),
          ],
        ),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<String> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    String newTask = _taskController.text.trim();
    if (newTask.isNotEmpty) {
      setState(() {
        _tasks.add(newTask);
      });
      _taskController.clear();
    }
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _taskController,
                  decoration: InputDecoration(
                    hintText: 'Enter a task',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _addTask,
                child: Text('Add'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 244, 159, 201),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _tasks.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: ListTile(
                  title: Text(
                    _tasks[index],
                    style: TextStyle(
                      color: Color.fromARGB(255, 236, 160, 203),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(index),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
