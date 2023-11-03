// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  final TextEditingController _textEditingController = TextEditingController();
  String _username = '';

  @override
  void initState() {
    super.initState();
    _loadUsernameFromPrefs();
  }

  Future<void> _loadUsernameFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
    });
  }

  Future<void> _saveUsernameToPrefs(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practical 8'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello, $_username'), // Display greetings message
            const SizedBox(height: 20), // Add space between the Text and TextField
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(labelText: 'Enter your name'),
            ),
            const SizedBox(height: 20), // Add space between the TextField and ElevatedButton
            ElevatedButton(
              onPressed: () {
                final newUsername = _textEditingController.text;
                _saveUsernameToPrefs(newUsername);
                setState(() {
                  _username = newUsername;
                });
              },
              child: const Text('Save'),
            ),
          ],
        ),
      )

    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
