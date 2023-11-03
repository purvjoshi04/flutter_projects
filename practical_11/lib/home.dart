import 'package:flutter/material.dart';
import 'package:practical_11/add_studentscreen.dart';
import 'package:practical_11/list_student.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title:const Text("Sqflite Demo"),
        ),
        body: Center(
            child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddStudentScreen()));
                },
                child: const Text("Add Student")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListStudentScreen()));
                },
                child: const Text("List Student Record")),
          ],
        )),
      ),
    );
  }
}
