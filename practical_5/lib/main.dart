import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Profile',
      home: MyProfile(),
    );
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
                radius: 80, backgroundImage: AssetImage('assets/image.png')),
            SizedBox(height: 20),
            Text(
              '202103103510429',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Purv Joshi',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('Hobby 1'),
                ),
                Chip(
                  label: Text('Hobby 2'),
                ),
                Chip(
                  label: Text('Hobby 3'),
                ),
                // Add more hobbies as needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}
