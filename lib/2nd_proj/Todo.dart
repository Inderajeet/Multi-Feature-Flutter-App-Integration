import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textController = TextEditingController();
  List<String> task = [];

  void addTask(text) {
    setState(() {
      task.add(text);
    });
  }

  void resetTask() {
    setState(() {
      task = [];
    });
  }

  void deleteTask(index) {
    setState(() {
      task.removeAt(index);
    });
  }

  Future<void> editForm(BuildContext context, index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Edit task'),
            content: TextField(
              controller: textController,
              decoration: InputDecoration(labelText: 'Edit your task'),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  String editText = textController.text;
                  setState(() {
                    task[index] = editText;
                  });
                  textController.clear();
                  Navigator.of(context).pop();
                },
                child: Text('Edit task'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }

  Future<void> openForm(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add task'),
          content: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              labelText: 'Enter your task',
            ),
          ),
          actions: [
            ElevatedButton(
              // add btn
              onPressed: () {
                String text = textEditingController.text;
                if (text.isNotEmpty) {
                  addTask(text);
                  textEditingController.clear();
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add task'),
            ),
            ElevatedButton(
              // cancel btn
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            height: 4,
            color: Colors.grey,
          );
        },
        itemCount: task.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.check_box_outline_blank),
            title: Text(task[index]),
            trailing: SizedBox(
              width: 80,
              child: Row(children: [
                IconButton(
                  // edit btn
                  onPressed: () {
                    editForm(context, index);
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  // delete btn
                  onPressed: () {
                    deleteTask(index);
                  },
                  icon: Icon(Icons.delete_outline),
                ),
              ]),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              resetTask();
            },
            child: Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: () {
              openForm(context);
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
