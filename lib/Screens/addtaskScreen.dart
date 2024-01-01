import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Data/tasklist.dart';
import 'package:todo/Model/Task.dart';
import 'package:todo/Widgets/taskInput_widget.dart';
import 'package:todo/Widgets/timeInputWidegt.dart';

class Addtask extends StatelessWidget {
  Addtask({super.key});
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController titxd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //var add1 = Provider.of<tasklistClass>(context);
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'NewTask',
                style: TextStyle(
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.cancel_rounded,
                    size: 25,
                    color: Colors.black,
                  ))
            ],
          ),
          TaskInput(txd: textEditingController),
          SizedBox(
            height: 10,
          ),
          TimeInput(titxd: titxd),
          Spacer(),
          InkWell(
            onTap: () {
              if (textEditingController.text.isEmpty || titxd.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Please fill above details ',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.black,
                  duration: Duration(milliseconds: 500),
                ));
              } else {
                Provider.of<tasklistClass>(context, listen: false).addTask(
                    '01',
                    textEditingController.text,
                    DateTime.tryParse(titxd.text)!,
                    false);

                Navigator.of(context).pop();
              }

              // tasklistClass().addTask('01', textEditingController.text,
              //     DateTime.tryParse(titxd.text)!, false);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Create',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
