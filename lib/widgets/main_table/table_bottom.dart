import 'package:flutter/material.dart';

class TableBottom extends StatelessWidget {
  final String date;
  final String totalPresentStudents;
  final String totalStudents;

  TableBottom({this.date, this.totalPresentStudents, this.totalStudents});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FlexColumnWidth(4),
            1: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text('Total Number of Students Attended'),
                )),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text('$totalPresentStudents/$totalStudents'),
                ))
              ],
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Verified By Principal'),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text('Rani Saji'),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text('Verified By Pastor In Charge'),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text('Shaji Thomas'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Text(
            'Date: $date',
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}
