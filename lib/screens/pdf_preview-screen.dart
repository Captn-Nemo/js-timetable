import 'package:flutter/material.dart';
import 'package:js_timetable/providers/class_data.dart';
import 'package:js_timetable/widgets/pdf_table/full_pdf.dart';
import 'package:js_timetable/widgets/pdf_table/pdf_top_info.dart';
import 'package:js_timetable/widgets/main_table/table.dart';
import 'package:js_timetable/widgets/main_table/table_bottom.dart';
import 'package:js_timetable/widgets/main_table/table_header.dart';
import 'package:provider/provider.dart';

// class PreviewScreen extends StatelessWidget {
//   static final routeName = '/preview';
//   final String path;
//   const PreviewScreen({Key key, this.path}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PDFViewerScaffold(
//       path: path,
//     );
//   }
// }

class PreviewScreen extends StatelessWidget {
  static final routeName = '/preview';
  @override
  Widget build(BuildContext context) {
    final classProvider = Provider.of<ClassData>(context);
    final list = classProvider.getAttendance;
    final date = classProvider.getDate;
    final totalStudents = classProvider.totalStudents;
    final presentStudents = classProvider.totalPresentStudents;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Pdf'),
        actions: [
          IconButton(
              icon: const Icon(Icons.cloud_upload),
              onPressed: () {
                Navigator.of(context).pushNamed(PreviewScreen.routeName);
              }),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              reportPDFView(
                  context, list, date, totalStudents, presentStudents);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              PDFTopInfo(),
              TableHeader(),
              TableData(),
              TableBottom(
                date: date,
                totalPresentStudents: presentStudents,
                totalStudents: totalStudents,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
