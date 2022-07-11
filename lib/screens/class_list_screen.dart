import 'package:flutter/material.dart';
import 'package:js_timetable/providers/class_data.dart';
import 'package:js_timetable/screens/pdf_preview-screen.dart';
import 'package:js_timetable/widgets/app_drawer.dart';
import 'package:js_timetable/widgets/class_tile.dart';
import 'package:provider/provider.dart';

class ClassListScreen extends StatelessWidget {
  static const routeName = '/submit-screen';

  @override
  Widget build(BuildContext context) {
    Future<void> _refreshClassData(BuildContext context) async {
      await Provider.of<ClassData>(context, listen: false)
          .fetchAndStoreClassData();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Jesus School'),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(PreviewScreen.routeName);
                })
          ],
        ),
        drawer: AppDrawer(),
        body: RefreshIndicator(
          onRefresh: () => _refreshClassData(context),
          child: FutureBuilder(
            future: Provider.of<ClassData>(context, listen: false)
                .fetchAndStoreClassData(),
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
                              onPressed: () => _refreshClassData(context)),
                        ),
                      )
                    ],
                  ));
                } else {
                  return Consumer<ClassData>(
                      builder: (ctx, classData, child) => ListView.builder(
                          itemCount: classData.getAttendance.length,
                          itemBuilder: (_, i) => ClassTile(
                                className: classData.getAttendance[i].std,
                                totalStudents:
                                    classData.getAttendance[i].totalStudents,
                                teacher: classData.getAttendance[i].name,
                              )));
                }
              }
            },
          ),
        ));
  }
}
