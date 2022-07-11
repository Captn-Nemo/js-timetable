import 'package:flutter/material.dart';
import 'package:js_timetable/widgets/manage_class_tile.dart';
import 'package:provider/provider.dart';

import '../providers/class_data.dart';

class ManagClassScreen extends StatelessWidget {
  static final routeName = '/manage-class';
  @override
  Widget build(BuildContext context) {
    final classList = Provider.of<ClassData>(context).getAttendance;

    return Scaffold(
        appBar: AppBar(
          title: Text('Manage Class'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: classList
                .map((e) => ManageClassTile(
                      std: e.std,
                      totalStudents: e.totalStudents,
                      teacher: e.name,
                      time: e.time,
                    ))
                .toList(),
          ),
        ));
  }
}
