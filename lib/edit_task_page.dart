import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final Map taskObj;

  String _newText = '';

  EditPage(this.taskObj);

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Task',
          style: TextStyle(
            fontSize: 34,
            fontFamily: 'Airbnb',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
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
                  hintText: taskObj['task'],
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          taskObj['task'] = _newText;
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.done,
        ),
      ),
    );
  }
}
