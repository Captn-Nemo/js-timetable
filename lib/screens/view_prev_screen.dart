import 'package:flutter/material.dart';
import 'package:js_timetable/pages/att_class.dart';
import 'package:js_timetable/pages/att_date.dart';

class ViewPreviousHistory extends StatefulWidget {
  // const ViewPreviousHistory({ Key? key }) : super(key: key);
  static const routeName = '/view-previous';
  @override
  _ViewPreviousHistoryState createState() => _ViewPreviousHistoryState();
}

class _ViewPreviousHistoryState extends State<ViewPreviousHistory>
    with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Previous Attendences'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: 'View By Class',
            ),
            Tab(
              text: 'View By Date',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ViewAttendenceByClass(),
          ViewAttendenceByDate(),
        ],
      ),
    );
  }
}
