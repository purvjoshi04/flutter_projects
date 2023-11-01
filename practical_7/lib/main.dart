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
      title: 'Practical 7',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Practical 7"),
        ),
        body: GridView(
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 3,
           ),
          children: [
            Image.asset("assets/images/camera.jpeg"),
            Image.asset("assets/images/headphones.jpeg"),
            Image.asset("assets/images/index.jpeg"),
            Image.asset("assets/images/laptops.jpeg"),
            Image.asset("assets/images/pexels-math-90946.jpg"),
            Image.asset("assets/images/fold5.jpeg"),
            Image.asset("assets/images/imac.jpeg"),
            Image.asset("assets/images/iwatch.jpeg"),
            Image.asset("assets/images/pixel8.jpeg"),
            Image.asset("assets/images/pixel-fold.jpeg"),
          ],
        ),
      ),
    );
  }
}

