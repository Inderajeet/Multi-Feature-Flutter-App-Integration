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
  List<String> completedTask = [];

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

  void checkedTask(index) {
    setState(() {
      String checkedItem = task.removeAt(index);
      completedTask.add(checkedItem);
    });
  }

  void unCheckTask(index) {
    setState(() {
      String unCheckedItem = completedTask.removeAt(index);
      task.add(unCheckedItem);
    });
  }

  void deleteTask(index) {
    setState(() {
      task.removeAt(index);
    });
  }

  void checkDeleteTask(index) {
    setState(() {
      completedTask.removeAt(index);
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
          return const Divider(
            height: 4,
            color: Colors.grey,
          );
        },
        itemCount: task.length + completedTask.length,
        itemBuilder: (context, index) {
          if (index < task.length) {
            return ListTile(
              leading: IconButton(
                icon: const Icon(Icons.check_box_outline_blank),
                onPressed: () {
                  checkedTask(index);
                },
              ),
              title: Text(task[index]),
              trailing: SizedBox(
                width: 80,
                child: Row(children: [
                  IconButton(
                    // edit btn
                    onPressed: () {
                      editForm(context, index);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    // delete btn
                    onPressed: () {
                      deleteTask(index);
                    },
                    icon: const Icon(Icons.delete_outline),
                  ),
                ]),
              ),
            );
          } else {
            final completedIndex = index - task.length;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Completed Tasks',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    leading: IconButton(
                      icon: const Icon(Icons.check_box_outlined),
                      onPressed: () {
                        unCheckTask(completedIndex);
                      },
                    ),
                    title: Text(
                      completedTask[completedIndex],
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        checkDeleteTask(completedIndex);
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              resetTask();
            },
            child: const Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: () {
              openForm(context);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
