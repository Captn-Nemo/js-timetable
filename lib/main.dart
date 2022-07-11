import 'package:flutter/material.dart';
import 'package:js_timetable/providers/attendence.dart';
import 'package:js_timetable/providers/class_data.dart';
import 'package:js_timetable/screens/class_list_screen.dart';
import 'package:js_timetable/screens/main_screen.dart';
import 'package:js_timetable/screens/manage_class_screen.dart';
import 'package:js_timetable/screens/pdf_preview-screen.dart';
import 'package:js_timetable/screens/view_prev_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ClassData()),
        ChangeNotifierProvider.value(value: ClassAttendence())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.teal),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (ctx) => MainScreen(),
          ClassListScreen.routeName: (ctx) => ClassListScreen(),
          PreviewScreen.routeName: (ctx) => PreviewScreen(),
          ManagClassScreen.routeName: (ctx) => ManagClassScreen(),
          ViewPreviousHistory.routeName: (ctx) => ViewPreviousHistory(),
        },
      ),
    );
  }
}
