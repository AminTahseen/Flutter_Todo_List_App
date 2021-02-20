import 'package:flutter/material.dart';

class CardCount extends StatelessWidget {
  final int _remainCount;
  final int _completedCount;

  CardCount(this._remainCount, this._completedCount);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Card(
            elevation: 5,
            margin: EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '${_remainCount.toString()}',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Remains',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            elevation: 5,
            margin: EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '${_completedCount.toString()}',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Completed',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
