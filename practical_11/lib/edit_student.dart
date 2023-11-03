import 'package:flutter/material.dart';
import 'package:practical_11/database_helper.dart';
import 'package:practical_11/student.dart';
import 'package:practical_11/student_data_provider.dart';
import 'package:provider/provider.dart';

class EditStudent extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final int studentId; // Add this to receive the student's ID

  EditStudent({required this.studentId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Student'),
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
               
                final String name = nameController.text;
                final String rollNumber = rollNumberController.text;
                final String address = addressController.text;

              
                final updatedStudent = Student(
                  id: studentId, 
                  name: name,
                  rollNumber: rollNumber,
                  address: address,
                );

                
                DatabaseHelper.instance.updateStudent(updatedStudent);

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
