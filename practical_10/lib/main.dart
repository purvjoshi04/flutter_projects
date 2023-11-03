import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:practical_10/student_api_service.dart';
import 'package:practical_10/student_profile.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic>? studentList;
  final chopper = ChopperClient(
      baseUrl: Uri.tryParse("https://dummyjson.com"),
      services: [StudentApiService.create()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter());

  void getUserData() async {
    final userApiService = chopper.getService<StudentApiService>();
    final response = await userApiService.getUsers();
    setState(() {
      studentList = response.body["users"];
    });
  }

  @override
  Widget build(BuildContext context) {
    getUserData();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Practical 10"),
        ),
        body: studentList == null
            ? const Text("Loading ...")
            : ListView.separated(
                itemBuilder: (context, index) => Card(
                  elevation: 5,
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                      "${studentList![index]['firstName']} ${studentList![index]['lastName']}",
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentProfile(
                            name:
                                "${studentList![index]['firstName']} ${studentList![index]['lastName']}",
                            logo: studentList![index]['image'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: studentList!.length,
              ),
      ),
    );
  }
}
