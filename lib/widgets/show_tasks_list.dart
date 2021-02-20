import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import './no_tasks.dart';
import 'package:intl/intl.dart';

class TaskList extends StatelessWidget {
  final List<TodoTask> _taskList;
  final Function _editTask;
  final Function _removeTask;

  TaskList(this._taskList, this._editTask, this._removeTask);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: _taskList.length == 0
          ? NoTasks()
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: _taskList[index].isCompleted == true
                        ? Icon(Icons.assignment_turned_in, color: Colors.green)
                        : Icon(Icons.timer),
                    title: _taskList[index].isCompleted == true
                        ? Text(
                            _taskList[index].todoDetails,
                            style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        : Text(
                            _taskList[index].todoDetails,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        DateFormat.yMMMMd().format(_taskList[index].ondate),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.yellow),
                          onPressed: () => _editTask(_taskList[index]),
                        ),
                        IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removeTask(index)),
                      ],
                    ),
                  ),
                );
              },
              itemCount: _taskList.length,
            ),
    );
  }
}
