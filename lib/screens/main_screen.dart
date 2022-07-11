import 'package:animated_background/animated_background.dart';
import 'package:animated_background/lines.dart';

///Main Screen of the Application. This is the first Screen shoen after the application is loaded

import 'package:flutter/material.dart';
import 'package:js_timetable/screens/class_list_screen.dart';
import 'package:js_timetable/screens/manage_class_screen.dart';
import 'package:js_timetable/screens/view_prev_screen.dart';
import 'package:js_timetable/widgets/app_drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int _currentIndex = 1;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    Center(
      child: Text('Welcome To Heavenly Feast Jesus School'),
    ),
    ClassListScreen(),
    ViewPreviousHistory(),
    ManagClassScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: onTabTapped, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.list),
                label: 'Submit',
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.history),
                label: 'View',
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.edit),
                label: 'Manage',
              ),
            ],
          ),
          body: _children[_currentIndex],
        ),
      ),
    );
  }
}
