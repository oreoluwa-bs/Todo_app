import 'package:flutter/material.dart';

import './sliver_bar.dart';
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

  createAddTaskDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
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
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text('Cancel'),
                onPressed: () {
                  _textController.clear();
                  Navigator.of(context).pop();
                },
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
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

  Widget _buildTaskList(context, int index) {
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
      body: CustomScrollView(
        slivers: <Widget>[
          Sliverbar('My Day'),
          _tasks.length > 0
              ? (SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return _buildTaskList(context, index);
                    },
                    childCount: _tasks.length,
                  ),
                ))
              : SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 100),
                      child: Text(
                        'Tap the + icon to add a task',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ]),
                )
        ],
      ),
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
