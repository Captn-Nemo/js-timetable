import 'package:flutter/material.dart';
import 'package:js_timetable/providers/class_data.dart';
import 'package:provider/provider.dart';

class TableData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ClassData>(context).getAttendance;

    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
        // 4: FixedColumnWidth(70),
        3: FlexColumnWidth(),
        4: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: list
          .map(
            (classData) => TableRow(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(classData.name),
                )),
                Center(child: Text(classData.std)),
                Center(
                    child: classData.presentStudents == '0'
                        ? const Text('-')
                        : Text(classData.chapter)),
                // Center(
                //     child: Padding(
                //   padding: const EdgeInsets.all(3.0),
                //   child: Text(classData.time),
                // )),
                Center(child: Text(classData.totalStudents)),
                Center(
                    child: classData.presentStudents == '0'
                        ? const Text('-')
                        : Text(classData.presentStudents)),
              ],
            ),
          )
          .toList(),
    );
  }
}
