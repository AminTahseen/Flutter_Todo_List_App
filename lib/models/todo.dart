import 'package:flutter/foundation.dart';

class TodoTask {
  final String id;
  final String todoDetails;
  final bool isCompleted;
  final DateTime ondate;

  TodoTask({
    @required this.id,
    @required this.todoDetails,
    @required this.isCompleted,
    @required this.ondate,
  });
}
