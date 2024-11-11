import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/add");
                },
                child: Text("add task")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/task");
                },
                child: Text("Task list"))
          ],
        ),
      ),
    );
  }
}
