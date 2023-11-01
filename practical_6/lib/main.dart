import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CollegeSemesterList(),
    );
  }
}

class CollegeSemesterList extends StatelessWidget {
  CollegeSemesterList({super.key});
  final List<String> semesters =
  [
    'Semester-1 Division A',
    'Semester-1 Division B',
    'Semester-1 Division C',
    'Semester-1 Division D',
    'Semester-3 Division A',
    'Semester-3 Division B',
    'Semester-3 Division C',
    'Semester-3 Division D',
    'Semester-5 Division A',
    'Semester-5 Division B',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practical 6'),
      ),
      body: ListView.separated(
        itemCount: semesters.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(semesters[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentList(semesterName: semesters[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class StudentList extends StatelessWidget {
  final String semesterName;


  final List<String> students = [
    'Student 1',
    'Student 2',
    'Student 3',
    'Student 4',
    'Student 5',
    'Student 6',
    'Student 7',
    'Student 8',
    'Student 9',
    'Student 10',
    'Student 11',
    'Student 12',
    'Student 13',
    'Student 14',
    'Student 15',
    'Student 16',
    'Student 17',
    'Student 18',
    'Student 19',
    'Student 20',
  ];

  StudentList({required this.semesterName,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students in $semesterName'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index]),
          );
        },
      ),
    );
  }
}
