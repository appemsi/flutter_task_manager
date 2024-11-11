import 'package:flutter/material.dart';
import 'package:task_manager/pages/db.dart';

class Add extends StatelessWidget {
  SqlDb db = SqlDb();
  TextEditingController name = new TextEditingController();
  TextEditingController date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add task"),
      ),
      body: Column(
        children: [
          Text("name"),
          TextField(
            controller: name,
          ),
          Text("date"),
          TextField(
            controller: date,
          ),
          ElevatedButton(
              onPressed: () async {
                String n = name.text;
                String d = date.text;
                String query =
                    "INSERT INTO 'taches'('name','date') VALUES('$n','$d')";
                int result = await db.insert(query);
                if (result == 0) {
                  print("Error");
                } else {
                  print("insert task");
                }

                name.text = "";
                date.clear();
              },
              child: Text("add"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/task");
        },
        child: Icon(Icons.list),
      ),
    );
  }
}
