import 'package:flutter/material.dart';
import 'package:js_timetable/providers/class_data.dart';
import 'package:provider/provider.dart';

class ChapterDropDown extends StatefulWidget {
  final String std;

  ChapterDropDown({this.std});

  @override
  _ChapterDropDownState createState() => _ChapterDropDownState();
}

class _ChapterDropDownState extends State<ChapterDropDown> {
  static const List<String> chapterList = [
    'Intro',
    'Rev',
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
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25'
  ];

  var chapterValue = '1';

  @override
  Widget build(BuildContext context) {
    final changeChapter = Provider.of<ClassData>(context).changeChapter;

    return Row(
      children: [
        Icon(
          Icons.book_sharp,
          size: 24,
          color: Theme.of(context).disabledColor,
        ),
        SizedBox(width: 5),
        DropdownButton<String>(
          value: chapterValue,
          icon: Icon(
            Icons.expand_more,
            color: Theme.of(context).accentColor,
          ),
          iconSize: 22,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Theme.of(context).accentColor,
          ),
          onChanged: (String newValue) {
            setState(() {
              chapterValue = newValue;
            });
            changeChapter(widget.std, newValue);
          },
          items: chapterList.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: Text(
                value,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
