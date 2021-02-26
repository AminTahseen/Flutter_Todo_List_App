import 'package:flutter/material.dart';

class NoTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/empty.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'No Todos Available',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Why Not Start Adding Some Tasks Todo ?',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
