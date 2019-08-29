import 'package:flutter/material.dart';

import './edit_task_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> _tasks = [
    {
      'task': 'Feed Bronco',
      'isCompleted': false,
    },
    {
      'task': "Date with ally",
      'isCompleted': false,
    },
    {
      'task': "Walk Bronco",
      'isCompleted': false,
    },
    {
      'task': 'Feede Bronco',
      'isCompleted': false,
    },
    {
      'task': "Datee with ally",
      'isCompleted': false,
    },
    {
      'task': "Walke Bronco",
      'isCompleted': false,
    },
    {
      'task': 'Feeda Bronco',
      'isCompleted': false,
    },
    {
      'task': "Datea with ally",
      'isCompleted': false,
    },
    {
      'task': "Walka Bronco",
      'isCompleted': false,
    },
  ];
  TextEditingController _textController = TextEditingController();

  // void editTask(taskobj, index) {
  //   print(taskobj);
  //   setState(() {
  //     // _tasks[index] = taskobj;
  //   });
  // }

  createAddTaskDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add a task'),
            content: TextField(
              autofocus: true,
              autocorrect: true,
              controller: _textController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Pick up flowers...',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  _textController.clear();
                  Navigator.of(context).pop();
                },
              ),
              RaisedButton(
                elevation: 5.0,
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_textController.text != "") {
                    setState(() {
                      _tasks.add({
                        'task': _textController.text.toString(),
                        'isCompleted': false,
                      });
                    });
                  }
                  _textController.clear();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget _buildTaskList() {
    return new ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        final item = _tasks[index]['task'];
        if (index < _tasks.length) {
          return Dismissible(
            key: Key(item),
            direction: DismissDirection.horizontal,
            dismissThresholds: const {DismissDirection.horizontal: 0.4},
            onDismissed: (direction) {
              setState(() {
                _tasks.removeAt(index);
              });
              Scaffold.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 3),
                  content: Text("$item was deleted")));
            },
            background: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.red[600],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.delete, color: Colors.white),
                  Icon(Icons.delete, color: Colors.white)
                ],
              ),
            ),
            child: _buildTaskItem(_tasks[index], index),
          );
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildTaskItem(Map taskObj, int index) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListTile(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EditPage(taskObj)));
        },
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        leading: IconButton(
            icon: taskObj['isCompleted']
                ? Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                    size: 30,
                  )
                : Icon(
                    Icons.check_circle_outline,
                    size: 30,
                  ),
            onPressed: () {
              setState(() {
                taskObj['isCompleted'] = !taskObj['isCompleted'];
              });
            }),
        title: Text(
          taskObj['task'],
          style: TextStyle(
              fontSize: 20,
              decoration: taskObj['isCompleted']
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(4294046193),
      appBar: AppBar(
          title: Text(
        'My Day',
        style: TextStyle(
          fontSize: 34,
          fontFamily: 'Airbnb',
          fontWeight: FontWeight.w500,
        ),
      )),
      body: _buildTaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAddTaskDialog(context);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
