import 'package:flutter/material.dart';
import 'package:practical_12/task_dao.dart';
import 'package:intl/intl.dart'; // For formatting the date


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prcatical - 12',
      home: TaskManager(),
    );
  }
}

class TaskManager extends StatefulWidget {
  @override
  _TaskManagerState createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  final TaskDao taskDao = TaskDao();
  List<Task> tasks = [];
  String newTaskTitle = "";
  DateTime? selectedDate;
  bool showCompletedTasks = false;

  @override
  void initState() {
    super.initState();
    _refreshTaskList();
  }

  void _refreshTaskList() async {
    final taskList = await taskDao.getTasks(showCompletedTasks);
    setState(() {
      tasks = taskList;
    });
  }

  void _addTask() async {
    if (newTaskTitle.isNotEmpty && selectedDate != null) {
      final newTask = Task(
        title: newTaskTitle,
        completed: false,
        dueDate: selectedDate,
      );
      await taskDao.insertTask(newTask);
      setState(() {
        newTaskTitle = "";
        selectedDate = null; // Reset selectedDate
      });
      _refreshTaskList();
    }
  }




  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practical - 12'),
        actions: <Widget>[
          Row(
            children: [
              Text('Show Completed Tasks'),
              Switch(
                value: showCompletedTasks,
                onChanged: (value) {
                  setState(() {
                    showCompletedTasks = value;
                    _refreshTaskList();
                  });
                },
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'New Task',
                  ),
                  onChanged: (value) {
                    setState(() {
                      newTaskTitle = value;
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: _addTask,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('Due Date:'),
              SizedBox(width: 10),
              Text(
                selectedDate == null
                    ? 'No Date'
                    : DateFormat('MM/dd/yyyy').format(selectedDate!),
              ),
              TextButton(
                onPressed: () => _selectDate(context),
                child: Text('Select Date'),
              ),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  trailing: Checkbox(
                    value: task.completed,
                    onChanged: (bool? value) {
                      task.completed = value!;
                      taskDao.updateTask(task);
                      _refreshTaskList();
                    },
                  ),
                  subtitle: task.dueDate != null
                      ? Text('Due Date: ${DateFormat('MM/dd/yyyy').format(task.dueDate!)}')
                      : Text('No Due Date'),
                  onLongPress: () {
                    taskDao.deleteTask(task.id!);
                    _refreshTaskList();
                  },
                )
                ;
              },
            ),
          )
          ,
        ],
      ),
    );
  }
}