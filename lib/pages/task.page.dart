import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task_manager/pages/db.dart';

class Task extends StatefulWidget {
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List<Map> taches = [];
  SqlDb db = SqlDb();

  @override
  void initState() {
    super.initState();
    fetchTache();
  }

  fetchTache() async {
    String query = "SELECT * FROM 'taches'";
    List<Map> response = await db.read(query);
    setState(() {
      taches = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("task list"),
      ),
      body: ListView.builder(
          itemCount: taches.length,
          itemBuilder: (buildcontext, index) {
            final tache = taches[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(tache['name']),
                subtitle: Text(tache['date']),
                trailing: IconButton(
                    onPressed: () async {
                      int id = tache['id'];
                      String query = "DELETE FROM taches WHERE id =$id";
                      int response = await db.delete(query);
                      if (response > 0) {
                        setState(() {
                          fetchTache();
                        });
                      }
                    },
                    icon: Icon(Icons.delete)),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/add");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
