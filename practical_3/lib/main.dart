import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Practical 3',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  int sum = 0;

  void calculateSum() {
    final firstNumber = int.tryParse(firstNumberController.text) ?? 0;
    final secondNumber = int.tryParse(secondNumberController.text) ?? 0;

    setState(() {
      sum = firstNumber + secondNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sum Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: firstNumberController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Enter the first number'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: secondNumberController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Enter the second number'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: calculateSum,
              child: const Text('Calculate Sum'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Sum: $sum',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
