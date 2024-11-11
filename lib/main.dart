import 'package:flutter/material.dart';
import 'package:task_manager/pages/add.page.dart';
import 'package:task_manager/pages/home.page.dart';
import 'package:task_manager/pages/task.page.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      "/": (context) => Home(),
      "/task": (context) => Task(),
      "/add": (context) => Add(),
    });
  }
}
