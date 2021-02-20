import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskDialog extends StatefulWidget {
  final Function _addTask;

  AddTaskDialog(this._addTask);

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _detailsController = TextEditingController();
  DateTime _selectedDate;
  void _submitForm() {
    final todoDesc = _detailsController.text;
    if (todoDesc.isEmpty) {
      return;
    } else {
      widget._addTask(todoDesc,_selectedDate);
      Navigator.of(context).pop();
    }
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Add Todo',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Please Provide details for todo',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: _detailsController,
                  decoration: InputDecoration(
                    labelText: 'Todo Details',
                  ),
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _selectedDate == null
                            ? 'No Date Chosen'
                            : DateFormat.yMd().format(_selectedDate),
                        style: TextStyle(fontSize: 25),
                      ),
                      FlatButton(
                        onPressed: _showDatePicker,
                        child: Text(
                          'Choose Date',
                          style: TextStyle(fontSize: 20),
                        ),
                        textColor: Colors.red,
                      ),
                    ]),
              ],
            ),
          ),
          RaisedButton(
            onPressed: _submitForm,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Add Todo',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
