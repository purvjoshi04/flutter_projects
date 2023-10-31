import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Switcher App',
      theme: ThemeData(
        primarySwatch: Colors.green, // Initial theme (EmeraldTheme)
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyThemeSwitcherPage(),
    );
  }
}

class MyThemeSwitcherPage extends StatefulWidget {
  const MyThemeSwitcherPage({super.key});

  @override
  _MyThemeSwitcherPageState createState() => _MyThemeSwitcherPageState();
}

class _MyThemeSwitcherPageState extends State<MyThemeSwitcherPage> {
  bool isEmeraldTheme = true;

  void toggleTheme() {
    setState(() {
      isEmeraldTheme = !isEmeraldTheme;
    });
  }

  String getThemeName() {
    return isEmeraldTheme ? "EmeraldTheme" : "RubyTheme";
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = isEmeraldTheme
        ? ThemeData(
            primarySwatch: Colors.green, // EmeraldTheme
            visualDensity: VisualDensity.adaptivePlatformDensity,
          )
        : ThemeData(
            primarySwatch: Colors.red, // RubyTheme
            visualDensity: VisualDensity.adaptivePlatformDensity,
          );

    return MaterialApp(
      theme: currentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Practical_2"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 100,
                child: TextField(
                  decoration: InputDecoration(hintText: "Enter Value Here"),
                ),
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    toggleTheme();
                    setState(() {});
                  },
                  child: Text('Switch Theme to ${getThemeName()}'),
                ),
              ),
              const SizedBox(
                height: 30, // Add space of 20 units
              ),
              Text(
                'Current Theme: ${getThemeName()}',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
