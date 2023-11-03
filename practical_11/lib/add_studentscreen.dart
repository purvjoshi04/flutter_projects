import 'package:flutter/material.dart';
import 'package:practical_11/database_helper.dart';
import 'package:practical_11/student.dart';
import 'package:practical_11/student_data_provider.dart';
import 'package:provider/provider.dart';

class AddStudentScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final rollNumberController = TextEditingController();
  final addressController = TextEditingController();

  AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: rollNumberController,
              decoration: const InputDecoration(labelText: 'Roll Number'),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final rollNumber = rollNumberController.text;
                final address = addressController.text;
                final student = Student(
                  name: name,
                  rollNumber: rollNumber,
                  address: address,
                );

                DatabaseHelper.instance.insertStudent(student);

                context.read<StudentDataProvider>().loadStudents();

                Navigator.pop(context);
              },
              child: const Text('Save Student Data'),
            ),
          ],
        ),
      ),
    );
  }
}
