import 'package:sqflite/sqflite.dart';
import 'DatabaseHelper.dart';
import 'app_database.dart';
class Task {
  int? id;
  String title;
  bool completed;
  DateTime? dueDate; // Updated to DateTime

  Task({this.id, required this.title, required this.completed, this.dueDate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'completed': completed ? 1 : 0,
      'dueDate': dueDate != null ? dueDate!.millisecondsSinceEpoch : null, 
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      completed: map['completed'] == 1,
      dueDate: map['dueDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['dueDate']) : null, 
    );
  }
}


class TaskDao {
  final dbHelper = DatabaseHelper.instance;

  Future<int> insertTask(Task task) async {
    final db = await dbHelper.database;
    return await db.insert('tasks', task.toMap());
  }

  Future<List<Task>> getAllTasks() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }

  Future<int> updateTask(Task task) async {
    final db = await dbHelper.database;
    return await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await dbHelper.database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Task>> getTasks(bool showCompleted) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = showCompleted
        ? await db.query('tasks')
        : await db.query('tasks', where: 'completed = ?', whereArgs: [0]);
    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }

}