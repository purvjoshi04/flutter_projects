import 'package:flutter/material.dart';
import 'package:practical_11/home.dart';
import 'package:practical_11/student_data_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentDataProvider(),
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
