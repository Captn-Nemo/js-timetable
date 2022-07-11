import 'package:flutter/material.dart';
import 'package:js_timetable/providers/class_data.dart';
import 'package:provider/provider.dart';

class AttendenceDropDown extends StatefulWidget {
  final String std;
  final String totalStudents;

  AttendenceDropDown({this.std, this.totalStudents});
  @override
  _AttendenceDropDownState createState() => _AttendenceDropDownState();
}

class _AttendenceDropDownState extends State<AttendenceDropDown> {
  String presentStudentValue = '1';
  @override
  Widget build(BuildContext context) {
    var studentList =
        new List<int>.generate(int.parse(widget.totalStudents), (i) => i + 1);
    studentList.add(0);
    final changeAttendence =
        Provider.of<ClassData>(context, listen: false).changeAttendence;

    return Row(
      children: [
        Icon(
          Icons.people,
          size: 24,
          color: Theme.of(context).disabledColor,
        ),
        SizedBox(width: 5),
        DropdownButton<String>(
          value: presentStudentValue,
          icon: Icon(Icons.expand_more, color: Theme.of(context).primaryColor),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Theme.of(context).accentColor,
          ),
          onChanged: (String newValue) {
            setState(() {
              presentStudentValue = newValue;
            });

            changeAttendence(widget.std, newValue);
          },
          items: studentList.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: Text(
                value.toString(),
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
