import 'package:flutter/material.dart';
import './widgets/show_cards_count.dart';
import './widgets/show_tasks_list.dart';
import './widgets/add_task_dialog.dart';
import './widgets/filter_list_dialog.dart';
import './models/todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TodoTask> _todoList = [];
  List<TodoTask> _copyList = [];
  void _addNewTodo(String details, DateTime selectedDate) {
    final task = new TodoTask(
      id: DateTime.now().toString(),
      todoDetails: details,
      isCompleted: false,
      ondate: selectedDate,
    );
    setState(() {
      _todoList.add(task);
      _copyList.add(task);
    });
  }

  void _completeTask(TodoTask obj) {
    var index = _todoList.indexOf(obj);
    final updated = new TodoTask(
      id: obj.id,
      todoDetails: obj.todoDetails,
      isCompleted: true,
      ondate: obj.ondate,
    );
    setState(() {
      _todoList.removeAt(index);
      _todoList.insert(index, updated);
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  int get _completedTaskCount {
    return _todoList
        .where((element) => element.isCompleted == true)
        .toList()
        .length;
  }

  int get _remainTaskCount {
    return _todoList
        .where((element) => element.isCompleted == false)
        .toList()
        .length;
  }

  void _filterCompletedTasks() {
    setState(() {
      _todoList =
          _todoList.where((element) => element.isCompleted == true).toList();
    });
  }

  void _filterAllTasks() {
    setState(() {
      _todoList.clear();
      _todoList = _copyList;
    });
  }

  void _showTaskAddDialog(BuildContext ctx) {
    print('Show Add Task Dialog');
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: AddTaskDialog(_addNewTodo),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _showFilterDialog(BuildContext ctx) {
    print('Show Filter Dialog');
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: FilterListDialog(
              _filterCompletedTasks,
              _filterAllTasks,
            ),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Todoist'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.filter_list, color: Colors.white),
          onPressed: () => _showFilterDialog(context),
        )
      ],
    );
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.4,
              child: CardCount(
                _remainTaskCount,
                _completedTaskCount,
              ),
            ),
            Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.6,
              child: TaskList(
                _todoList,
                _completeTask,
                _deleteTask,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskAddDialog(context),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
