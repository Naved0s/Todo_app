import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/Data/tasklist.dart';
import 'package:todo/Screens/addtaskScreen.dart';
import 'package:todo/Widgets/task_Widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _mybox = Hive.box('mybox');
  @override
  void initState() {
    final taskListProvider = Provider.of<tasklistClass>(context, listen: false);
    //if this is first time of opening the app
    if (_mybox.get("TODOLIST") == null) {
      taskListProvider.createInitialData();
      // print('New DATA');
    } else {
      taskListProvider.loadData();
      //print('GETTING VALUS SAVING');
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mybox.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return Addtask();
            }));
          },
          child: Icon(Icons.add)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tasks',
                    style: TextStyle(
                        fontSize: 50,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sort,
                        size: 25,
                        color: Colors.black,
                      ))
                ],
              ),

              Expanded(
                  child: Consumer<tasklistClass>(
                builder: (ctx, value, child) => value.tasklist.isEmpty
                    ? Center(
                        child: Container(
                          child: Text('Nothing today!',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (ctx, index) {
                          return Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red),
                            ),
                            onDismissed: (direction) {
                              setState(() {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    'Deletetd',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.black,
                                  duration: Duration(milliseconds: 500),
                                ));
                                print(index);
                                Provider.of<tasklistClass>(context,
                                        listen: false)
                                    .removeTask(index);

                                //  tasklistClass().updateData();
                              });
                            },
                            child: TaskWidget(
                              index: index,
                              task: value.tasklist[index].title!,
                              dateTime: value.tasklist[index].dateTime!,
                              isdone: value.tasklist[index].isdone!,
                            ),
                          );
                        },
                        itemCount: value.tasklist.length,
                        shrinkWrap: true,
                      ),
              )),
              // child: ListView.builder(
              //   scrollDirection: Axis.vertical,
              //   itemBuilder: (ctx, index) {
              //     return TaskWidget(
              //         task: tasklistClass().tasklist[index].title,
              //         dateTime: tasklistClass().tasklist[index].dateTime,
              //         isdone: tasklistClass().tasklist[index].isdone);
              //   },
              //   itemCount: tasklistClass().tasklist.length,
              //   shrinkWrap: true,
              // ),

              // TaskWidget(
              //     task: 'hello', dateTime: DateTime.now(), isdone: true),
              // TaskWidget(
              //     task: 'world', dateTime: DateTime.now(), isdone: false),
              // TaskWidget(
              //     task: tasklist[0].title,
              //     dateTime: tasklist[0].dateTime,
              //     isdone: false),
              // TaskWidget(
              //     task: tasklist[1].title,
              //     dateTime: tasklist[1].dateTime,
              //     isdone: false),
            ],
          ),
        ),
      ),
    );
  }
}
