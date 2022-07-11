import 'package:flutter/material.dart';
import 'package:js_timetable/providers/attendence.dart';
import 'package:provider/provider.dart';

class ClassDropDown extends StatefulWidget {
  // const ClassDropDown({ Key? key }) : super(key: key);

  @override
  _ClassDropDownState createState() => _ClassDropDownState();
}

class _ClassDropDownState extends State<ClassDropDown> {
  static const List<String> classList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];

  var classValue = '1';
  @override
  Widget build(BuildContext context) {
    Function changeClass = Provider.of<ClassAttendence>(context).updateClass;

    return DropdownButton<String>(
      value: classValue,
      icon: Icon(
        Icons.expand_more,
        color: Theme.of(context).accentColor,
      ),
      iconSize: 30,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple, fontSize: 18),
      underline: Container(
        height: 2,
        color: Theme.of(context).accentColor,
      ),
      onChanged: (String newValue) {
        setState(() {
          classValue = newValue;
          changeClass(newValue);
        });
        // changeChapter(widget.std, newValue);
      },
      items: classList.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value.toString(),
          child: Text(
            value,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        );
      }).toList(),
    );
  }
}
