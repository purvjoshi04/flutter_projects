import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  final String name;
  final String logo;

  const StudentProfile({
    super.key,
    required this.name,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Student Details"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, border: Border.all(width: 10)),
                  child: Image.network(logo),
                ),
                const SizedBox(height: 50),
                Text(name),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
