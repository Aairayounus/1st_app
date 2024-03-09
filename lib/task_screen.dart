import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tast_app/font_class.dart';

class TaskScreen extends StatefulWidget {
  final String userName;

  const TaskScreen({Key? key, required this.userName}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late TextEditingController taskController;
  late List<String> tasks;

  @override
  void initState() {
    super.initState();
    taskController = TextEditingController();
    tasks = [];
    loadTasks();
  }

  void loadTasks() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    List<String>? savedTasks = sp.getStringList('tasks');
    if (savedTasks != null) {
      setState(() {
        tasks = savedTasks;
      });
    }
  }

  void saveTask(String task) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    tasks.add(task);
    sp.setStringList('tasks', tasks);
    setState(() {
      taskController.clear();
    });
  }

  void deleteTask(int index) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    tasks.removeAt(index);
    sp.setStringList('tasks', tasks);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome, ${widget.userName}!',
          style: CustomTextStyle.taskStyle(),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteTask(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: 'Enter your Task',
                      hintStyle: CustomTextStyle.textFormStyle(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (taskController.text.isNotEmpty) {
                      saveTask(taskController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
