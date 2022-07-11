import 'package:flutter/material.dart';
import 'package:js_timetable/widgets/dropdowns/attendence_dropdown.dart';
import 'package:js_timetable/widgets/dropdowns/chapter_dropdown.dart';

class ClassTile extends StatelessWidget {
  final String className;
  final String totalStudents;
  final String teacher;

  ClassTile({this.className, this.totalStudents, this.teacher});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            child: Text(
              className,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          title: Text(
            'Students- $totalStudents',
            style: TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            '$teacher',
            style: TextStyle(fontSize: 11),
          ),
          // subtitle: Text('10'),
          trailing: Container(
            width: 160,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ChapterDropDown(std: className),
                SizedBox(width: 10),
                AttendenceDropDown(
                  std: className,
                  totalStudents: totalStudents,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
