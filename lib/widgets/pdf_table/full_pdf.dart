import 'package:js_timetable/models/table_row.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

pw.Widget _buildPDFHEaderInfo(String label, String text) {
  return pw.Column(children: [
    pw.Row(
        // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Container(
            width: 250,
            child: pw.Text(
              label,
              style: pw.TextStyle(fontSize: 12),
            ),
          ),
          pw.Container(
            width: 250,
            child: pw.Text(text, style: pw.TextStyle(fontSize: 12)),
          ),
        ]),
    pw.SizedBox(
      height: 20,
    ),
  ]);
}

pw.Widget _buildPDFBottomInfo(String label, String text) {
  return pw.Column(
    children: [
      pw.Text(label),
      pw.SizedBox(
        height: 10,
      ),
      pw.Center(
        child:
            pw.Text(text, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
      )
    ],
  );
}

reportPDFView(context, List<TableRowData> list, String date,
    String totalStudents, String presentStudents) async {
  final _tableData = list;
  final _tableHeaders = [
    'Teacher',
    'Class',
    'Chapter',
    'Time',
    'Total Students',
    'Students Present'
  ];

  final doc = pw.Document();
  doc.addPage(
    pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(children: [
              pw.Column(
                children: [
                  pw.Center(
                    child: pw.Text('Heavenly Feast'),
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Center(
                    child: pw.Text('Jesus School Weekly Report 2021'),
                  ),
                  pw.SizedBox(
                    height: 15,
                  ),
                  _buildPDFHEaderInfo('Name of Diocese and Church',
                      'HF Changanacherry (KTM Diocese II)'),
                  _buildPDFHEaderInfo(
                      'Name of Pastor in Charge :', 'Shaji Thomas'),
                  _buildPDFHEaderInfo('Name of Principal', 'Rani Saji'),
                ],
              ),
              pw.Center(
                child: pw.Table(
                  border: pw.TableBorder.all(),
                  columnWidths: {
                    0: pw.FixedColumnWidth(120),
                    1: pw.FlexColumnWidth(),
                    2: pw.FlexColumnWidth(),
                    3: pw.FlexColumnWidth(),
                    4: pw.FlexColumnWidth(),
                    5: pw.FlexColumnWidth(),
                  },
                  defaultVerticalAlignment:
                      pw.TableCellVerticalAlignment.middle,
                  children: [
                    pw.TableRow(
                      children: _tableHeaders
                          .map(
                            (e) => pw.Center(
                                child: pw.Padding(
                              padding: const pw.EdgeInsets.all(3.0),
                              child: pw.Text(e),
                            )),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              pw.Table(
                border: pw.TableBorder.all(),
                columnWidths: {
                  0: pw.FixedColumnWidth(120),
                  1: pw.FlexColumnWidth(),
                  2: pw.FlexColumnWidth(),
                  3: pw.FlexColumnWidth(),
                  4: pw.FlexColumnWidth(),
                  5: pw.FlexColumnWidth(),
                },
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: _tableData
                    .map(
                      (classData) => pw.TableRow(
                        children: [
                          pw.Center(
                              child: pw.Padding(
                            padding: const pw.EdgeInsets.all(3.0),
                            child: pw.Text(classData.name),
                          )),
                          pw.Center(child: pw.Text(classData.std)),
                          pw.Center(
                              child: classData.presentStudents == '0'
                                  ? pw.Text('-')
                                  : pw.Text(classData.chapter)),
                          pw.Center(
                              child: pw.Padding(
                            padding: const pw.EdgeInsets.all(3.0),
                            child: pw.Text(classData.time),
                          )),
                          pw.Center(child: pw.Text(classData.totalStudents)),
                          pw.Center(
                              child: classData.presentStudents == '0'
                                  ? pw.Text('-')
                                  : pw.Text(classData.presentStudents)),
                        ],
                      ),
                    )
                    .toList(),
              ),
              pw.Column(
                children: [
                  pw.Table(
                    border: pw.TableBorder.all(),
                    columnWidths: {
                      0: pw.FlexColumnWidth(5.65),
                      1: pw.FlexColumnWidth(),
                    },
                    defaultVerticalAlignment:
                        pw.TableCellVerticalAlignment.middle,
                    children: [
                      pw.TableRow(
                        children: [
                          pw.Center(
                              child: pw.Padding(
                            padding: const pw.EdgeInsets.all(3.0),
                            child: pw.Text('Total Number of Students Attended'),
                          )),
                          pw.Center(
                              child: pw.Padding(
                            padding: const pw.EdgeInsets.all(3.0),
                            child: pw.Text('$presentStudents/$totalStudents'),
                          ))
                        ],
                      )
                    ],
                  ),
                  pw.SizedBox(
                    height: 30,
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPDFBottomInfo('Verified By Principal', 'Rani Saji'),
                      _buildPDFBottomInfo(
                          'Verified By Pastor in Charge', 'Shaji Thomas'),
                    ],
                  ),
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Text('Date: $date',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
            ]),
          );
        }),
  ); // Page
  //save PDF
  await Printing.sharePdf(
      bytes: await doc.save(), filename: 'HF-CHRY-JS-$date.pdf');
}
