import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Data/tasklist.dart';
import 'package:intl/intl.dart';

class TaskWidget extends StatefulWidget {
  final String task;
  final DateTime dateTime;
  bool isdone;
  int index;

  TaskWidget(
      {super.key,
      required this.task,
      required this.dateTime,
      required this.isdone,
      required this.index});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  void check(isdone) {
    setState(() {
      widget.isdone = !widget.isdone;
      Provider.of<tasklistClass>(context, listen: false)
          .okdone(widget.index, widget.isdone);
      // print(widget.isdone);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.task,
                    style: TextStyle(
                        fontSize: 20,
                        decoration: widget.isdone == true
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Checkbox(value: widget.isdone, onChanged: check)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat('yyyy-MM-dd – kk:mm')
                      .format(widget.dateTime)
                      .toString()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
