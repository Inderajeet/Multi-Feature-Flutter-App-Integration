import 'package:flutter/material.dart';

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      home: AddList(),
    );
  }
}

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController text_Editing_Controller = TextEditingController();

  List<String> todo_arr = [];

  void addToDo(String text) {
    setState(() {
      todo_arr.add(text);
      textEditingController.clear();
      text_Editing_Controller.clear ();
    });
  }

  void reset() {
    setState(() {
      todo_arr = [];
    });
  }

  void delete_items(int index) {
    setState(() {
      todo_arr.removeAt(index);
    });
  }

  Future<void> showForm(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add your task'),
            content: Text('Todo'),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: TextField(
                  controller: text_Editing_Controller,
                  decoration: InputDecoration(
                    labelText: 'Enter your task',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      child: Text('Add Task'),
                      onPressed: () {
                        String add_to = text_Editing_Controller.text;
                        if (add_to.isNotEmpty) {
                          addToDo(add_to);
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: ElevatedButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter your task here'),
              controller: textEditingController,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      String todo_add = textEditingController.text;
                      if (todo_add != '') {
                        addToDo(todo_add);
                      }
                    },
                    child: Text('Add Task'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      reset();
                    },
                    child: Text('Reset'),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: todo_arr.length,
                separatorBuilder: (context, index) =>
                    Divider(color: Color.fromARGB(255, 83, 82, 82), height: 0.5),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todo_arr[index]),
                    trailing: SizedBox(
                      width: 80,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              delete_items(index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                    leading: IconButton(
                      icon: Icon(Icons.check_box_outline_blank_rounded),
                      onPressed: (){},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showForm(context);
        },
      ),
    );
  }
}