import 'package:flutter/foundation.dart';
import 'package:practical_11/student.dart';
import 'database_helper.dart';

class StudentDataProvider with ChangeNotifier {
  List<Student> _students = [];

  List<Student> get students => _students;

  Future<void> loadStudents() async {
    final db = await DatabaseHelper.instance.database;
    final maps = await db.query('students');
    _students = List.generate(maps.length, (i) {
      return Student.fromMap(maps[i]);
    });
    notifyListeners();
  }

  Future<void> addStudent(Student student) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('students', student.toMap());
    loadStudents();
  }

 
  Future<void> deleteStudent(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('students', where: 'id = ?', whereArgs: [id]);
    loadStudents();
  }

}
