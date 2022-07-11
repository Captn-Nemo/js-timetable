import 'package:flutter/material.dart';
import 'package:js_timetable/providers/attendence.dart';
import 'package:js_timetable/widgets/ViewByClass/ViewByClassTable.dart';
import 'package:js_timetable/widgets/ViewByClass/ViewbyClass_table_header.dart';
import 'package:js_timetable/widgets/dropdowns/selectclassDropdown.dart';
import 'package:provider/provider.dart';

class ViewAttendenceByClass extends StatefulWidget {
  // const ViewAttendenceByClass({ Key? key }) : super(key: key);

  @override
  _ViewAttendenceByClassState createState() => _ViewAttendenceByClassState();
}

class _ViewAttendenceByClassState extends State<ViewAttendenceByClass> {
  @override
  Widget build(BuildContext context) {
    final attendanceModal =
        Provider.of<ClassAttendence>(context, listen: false);
    return FutureBuilder(
      future: attendanceModal.fetchAndStoreAttendance(),
      builder: (ctx, dataSnapShot) {
        if (dataSnapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (dataSnapShot.error != null) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Error Fetching Data'),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: IconButton(
                        icon: const Icon(
                          Icons.refresh,
                          size: 30,
                        ),
                        onPressed: () => {}),
                  ),
                )
              ],
            ));
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Select Class',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          ClassDropDown(),
                        ],
                      ),
                    ),
                  ),
                  Card(elevation: 5, child: ViewByClass()),
                ],
              ),
            );
          }
        }
      },
    );
  }
}
