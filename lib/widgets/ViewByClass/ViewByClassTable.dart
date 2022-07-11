import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:js_timetable/models/PreviousAttModel.dart';
import 'package:js_timetable/providers/attendence.dart';
import 'package:js_timetable/providers/class_data.dart';
import 'package:js_timetable/widgets/ViewByClass/ViewbyClass_table_header.dart';
import 'package:provider/provider.dart';

class ViewByClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreviosAttModel listData =
        Provider.of<ClassAttendence>(context).submittedAttendence;

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          child: Consumer<ClassData>(
            builder: (ctx, clsData, child) {
              var data = clsData.getClassDetails(listData.classId);
              if (data.name != null)
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Teacher: ${data.name}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      'Total Students:  ${data.totalStudents}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                );
              else
                return Container(width: 0.0, height: 0.0);
            },
          ),
        ),
        ViewByClassTableHeader(),
        SingleChildScrollView(
          child: Table(
            border: TableBorder.all(),
            columnWidths: {
              0: FlexColumnWidth(),
              1: FlexColumnWidth(),
              2: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: listData.attendenceList
                .map(
                  (attendance) => TableRow(
                    children: [
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          DateFormat.yM()
                              .format(DateTime.parse(attendance.date)),
                          style: TextStyle(fontSize: 12),
                        ),
                      )),
                      Center(
                          child: attendance.presentStudents == '0'
                              ? const Text('-')
                              : Text(attendance.chapter)),
                      Center(
                          child: attendance.presentStudents == '0'
                              ? const Text('-')
                              : Text(attendance.presentStudents)),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
