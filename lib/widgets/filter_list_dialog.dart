import 'package:flutter/material.dart';

class FilterListDialog extends StatelessWidget {
  final Function _filterCompleted;
  final Function _filterAll;

  FilterListDialog(this._filterCompleted, this._filterAll);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Filter Todos',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Please select filtering method',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: Icon(Icons.filter_list, color: Colors.red),
              title: Text(
                'Filter By Completed Tasks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: FlatButton(
                child: Text('Apply Filter'),
                onPressed: _filterCompleted,
                textColor: Colors.red,
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: Icon(Icons.filter_list, color: Colors.red),
              title: Text(
                'Filter By All Tasks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: FlatButton(
                child: Text('Apply Filter'),
                onPressed: _filterAll,
                textColor: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
