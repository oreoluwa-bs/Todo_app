import 'package:flutter/material.dart';

import './sliver_bar.dart';

// class EditPage extends StatelessWidget {
// final Map taskObj;

// String _newText = '';

// EditPage(this.taskObj);

// final TextEditingController _textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
// title: Text(
//   'Edit Task',
//   style: TextStyle(
//     fontSize: 34,
//     fontFamily: 'Airbnb',
//     fontWeight: FontWeight.w500,
//   ),
// ),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             TextField(
//               onChanged: (text) {
//                 _newText = text;
//               },
//               autofocus: true,
//               autocorrect: true,
//               controller: _textController,
//               decoration: InputDecoration(
//                   hintText: taskObj['task'],
//                   border: OutlineInputBorder(),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
//             ),
//           ],
//         ),
//       ),
// floatingActionButton: FloatingActionButton(
//   onPressed: () {
//     taskObj['task'] = _newText;
//     Navigator.of(context).pop();
//   },
//   child: Icon(
//     Icons.done,
//   ),
// ),
//     );
//   }
// }

class EditPage extends StatelessWidget {
  final Map taskObj;

  String _newText = '';

  EditPage(this.taskObj);

  final TextEditingController _textController = TextEditingController();

  createAddTaskDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text('Error'),
            content: Text('Input field cannot be blank'),
            actions: <Widget>[
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5.0,
                child: Text(
                  'Okay',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _textController.clear();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          Sliverbar('Edit task'),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                        onChanged: (text) {
                          _newText = text;
                        },
                        autofocus: true,
                        autocorrect: true,
                        controller: _textController,
                        decoration: InputDecoration(
                            labelText: 'Task',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_newText.length > 0) {
            taskObj['task'] = _newText;
            Navigator.of(context).pop();
          } else {
            createAddTaskDialog(context);
          }
        },
        child: Icon(
          Icons.done,
        ),
      ),
    );
  }
}
