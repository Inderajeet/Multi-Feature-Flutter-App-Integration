import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController text_editing_controller = TextEditingController();
  TextEditingController text_controller = TextEditingController();

  List<String> toDo_arr = [];

  void addTask_todo(text) {
    setState(() {
      toDo_arr.add(text);
      text_editing_controller.clear();
    });
  }

  void reset_todo() {
    setState(() {
      toDo_arr = [];
    });
  }

  void deleteTask(index) {
    setState(() {
      toDo_arr.removeAt(index);
    });
  }

  // void editTask(text) {
  //   setState(() {
  //     toDo_arr.add(text);
  //   });
  // }

  void editTask(index) {
    setState(() {
      toDo_arr.add(index);
    });
    // editForm(index);
  }

  Future<void> editForm(BuildContext context, index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Edit Task'),
            content: TextField(
              controller: text_controller,
              // decoration: InputDecoration(
              //   labelText: ''
              // ),
            ),
            actions: [
              //update btn
              ElevatedButton(
                onPressed: () {
                  String editText = text_controller.text;
                  // String adding = toDo_arr[index];
                  // arr.add(toDo_arr[index]);
                  setState(() {
                    // toDo_arr.insert(index, editText);
                    toDo_arr[index] = editText;
                  });

                  // editTask(editText);
                  text_controller.clear();
                  Navigator.of(context).pop();
                },
                child: Text('Update'),
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

  Future<void> showForm(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Task'),
            content: TextField(
              controller: text_editing_controller,
              decoration: InputDecoration(labelText: 'Enter your task'),
            ),
            actions: [
              ElevatedButton(
                // add task button
                onPressed: () {
                  String addText = text_editing_controller.text;
                  if (addText.isNotEmpty) {
                    addTask_todo(addText);
                  }
                  Navigator.of(context).pop();
                },
                child: Text('Add task'),
              ),
              ElevatedButton(
                // cancel button
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
                height: 0.3,
              ),
              itemCount: toDo_arr.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.check_box_outline_blank), // checkbox
                  title: Text(toDo_arr[index]),
                  trailing: SizedBox(
                    width: 80,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          // Edit button
                          onPressed: () {
                            // print(toDo_arr[index]);
                            editForm(context, index);
                            // editTask(toDo_arr[index]);
                          },  
                          icon: Icon(Icons.mode_edit),
                        ),
                        IconButton(
                          // delete button
                          onPressed: () {
                            deleteTask(index);
                          },
                          icon: Icon(Icons.delete_forever_sharp),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showForm(context);
      //   },
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButton: Stack(
      //   children: [
      //     Positioned(
      //       bottom: 0,
      //       left: 30,
      //       child: FloatingActionButton(    //reset btn
      //         onPressed: () {
      //           reset_todo();
      //         },
      //         child: Icon(Icons.refresh),
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 0,
      //       right: 0,
      //       child: FloatingActionButton(    // add task btn
      //         onPressed: () {
      //           showForm(context);
      //         },
      //         child: Icon(Icons.add),
      //       ),
      //     ),
      //   ],
      // ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            //reset btn
            onPressed: () {
              reset_todo();
            },
            child: Icon(Icons.refresh),
          ),
          FloatingActionButton(
            // add task btn
            onPressed: () {
              showForm(context);
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
