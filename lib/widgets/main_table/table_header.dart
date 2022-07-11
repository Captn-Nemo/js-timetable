import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  final _tableHeaders = [
    'Teacher',
    'Class',
    'Chapter',
    'Total Students',
    'Students Present'
  ];
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
        // 3: FixedColumnWidth(70),
        4: FlexColumnWidth(),
        5: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: _tableHeaders
              .map(
                (e) => Center(
                    child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(e),
                )),
              )
              .toList(),
        ),
      ],
    );
  }
}
