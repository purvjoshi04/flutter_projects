import 'package:flutter/material.dart';
import 'package:practical_11/student_data_provider.dart';
import 'package:provider/provider.dart';

class ListStudentScreen extends StatelessWidget {
  const ListStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Student Records'),
      ),
      body: const ListStudents(),
    );
  }
}

class ListStudents extends StatelessWidget {
  const ListStudents({super.key});

  @override
  Widget build(BuildContext context) {
    final students = context.watch<StudentDataProvider>().students;

    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return Card(
            elevation: 4,
            margin: const EdgeInsets.all(7),
            child: ListTile(
              leading: const Icon(Icons.group),
              title: Text(student.name),
              subtitle: Row(
                children: [
                  Text("Roll No: ${student.rollNumber}"),
                  const SizedBox(width: 4),
                  Text("Add: ${student.address}"),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      context
                          .read<StudentDataProvider>()
                          .deleteStudent(student.id!);
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
