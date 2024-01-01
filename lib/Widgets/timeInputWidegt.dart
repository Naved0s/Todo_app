import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class TimeInput extends StatelessWidget {
  final TextEditingController titxd;
  TimeInput({super.key, required this.titxd});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: EdgeInsets.all(3),
          child: DateTimePicker(
              type: DateTimePickerType.dateTimeSeparate,
              dateMask: 'd MMM, yyyy',
              initialDate: DateTime.now(),
              initialTime: TimeOfDay.now(),
              initialValue: DateTime.now().toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              icon: Icon(Icons.event),
              dateLabelText: 'Date',
              timeLabelText: "Hour",
              onChanged: (val) => titxd.text = val,
              validator: (val) {
                print(val);
                return null;
              },
              onSaved: (val) {
                if (val != null) {
                  titxd.text = val;
                }
              } //titxd.text = val!,
              )
          // child: TextFormField(
          //   //controller: textEditingController,

          //   decoration: InputDecoration(
          //       hintText: 'Choose Date and Time',
          //       hintStyle: TextStyle(fontWeight: FontWeight.bold)),
          // ),
          ),
    );
  }
}
