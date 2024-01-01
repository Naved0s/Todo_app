import 'package:flutter/material.dart';

class TaskInput extends StatelessWidget {
  final TextEditingController txd;
  TaskInput({
    super.key,
    required this.txd,
  });
  // final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(3),
        child: TextFormField(
          controller: txd,
          maxLines: 5,
          decoration: InputDecoration(
              hintText: 'What needs to be done?',
              hintStyle: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
