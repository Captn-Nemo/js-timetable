import 'package:flutter/material.dart';

class ViewByClassTableHeader extends StatelessWidget {
  final _tableHeaders = ['Date', 'Chapter', 'Students Present'];
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        3: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: _tableHeaders
              .map(
                (e) => Center(
                    child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    e,
                    style: const TextStyle(fontSize: 12),
                  ),
                )),
              )
              .toList(),
        ),
      ],
    );
  }
}
