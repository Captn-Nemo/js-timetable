import 'package:flutter/material.dart';
import 'package:js_timetable/screens/manage_class_screen.dart';
import 'package:js_timetable/screens/pdf_preview-screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            iconTheme: Theme.of(context).iconTheme,
            title: Text('Jesus School CHRY'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list_alt),
            title: Text('Home'),
            onTap: () => Navigator.of(context).pushNamed('/'),
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.preview),
              title: Text('Preview Attendence'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(PreviewScreen.routeName);
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage Class'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(ManagClassScreen.routeName);
              })
        ],
      ),
    );
  }
}
