import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:js_timetable/models/table_row.dart';
import 'package:http/http.dart' as http;

class ClassData with ChangeNotifier {
  List<TableRowData> rawClassData = [
    TableRowData(
        name: 'Jancy Chacko',
        chapter: '1',
        std: '1',
        time: '2-2:30pm',
        totalStudents: '4',
        presentStudents: '1'),
    TableRowData(
        name: 'Susan Jaimy',
        chapter: '1',
        std: '2',
        time: '3-3:30pm',
        totalStudents: '3',
        presentStudents: '1'),
    TableRowData(
        name: 'Sumi Kiran',
        chapter: '1',
        std: '3',
        time: '1-1:30pm',
        totalStudents: '3',
        presentStudents: '1'),
    TableRowData(
        name: 'Bindhu Manoj',
        chapter: '1',
        std: '4',
        time: '3:30-4pm',
        totalStudents: '5',
        presentStudents: '1'),
    TableRowData(
        name: 'Sobha Mohan',
        chapter: '6',
        std: '5',
        time: '1-1:30pm',
        totalStudents: '4',
        presentStudents: '1'),
    TableRowData(
        name: 'Sheela Satheesan',
        chapter: '1',
        std: '6',
        time: '2-2:30pm',
        totalStudents: '4',
        presentStudents: '1'),
    TableRowData(
        name: 'Kannan MK',
        chapter: '1',
        std: '7',
        time: '2-2:30pm',
        totalStudents: '8',
        presentStudents: '1'),
    TableRowData(
        name: 'Jayamma Francis',
        chapter: '1',
        std: '8',
        time: '1-1:30pm',
        totalStudents: '3',
        presentStudents: '1'),
    TableRowData(
        name: 'Pushpa Maju',
        chapter: '1',
        std: '9',
        time: '3-3:30pm',
        totalStudents: '5',
        presentStudents: '1'),
    TableRowData(
        name: 'Valsamma Vargese',
        chapter: '1',
        std: '10',
        time: '3-3:30pm',
        totalStudents: '4',
        presentStudents: '1'),
    TableRowData(
        name: 'Rani Saji',
        chapter: '1',
        std: '11',
        time: '3-3:30pm',
        totalStudents: '5',
        presentStudents: '1'),
    TableRowData(
        name: 'Alphonsa Joseph',
        chapter: '1',
        std: '12',
        time: '3-3:30pm',
        totalStudents: '10',
        presentStudents: '1'),
  ];

  List<TableRowData> _classes = [];

  String chapterValue = '4';

  final String _date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  List<TableRowData> get getAttendance {
    return [..._classes];
  }

  String get getChapter {
    return chapterValue;
  }

  getClassDetails(String classId) {
    var data = _classes.singleWhere((cls) => cls.std == classId);
    return data;
  }

  String get totalStudents {
    int total = 0;
    _classes.forEach((classData) {
      total += int.parse(classData.totalStudents);
    });
    return total.toString();
  }

  String get totalPresentStudents {
    int total = 0;
    _classes.forEach((classData) {
      total += int.parse(classData.presentStudents);
    });
    return total.toString();
  }

  String get getDate {
    return _date.toString();
  }

  Future<void> fetchAndStoreClassData() async {
    const url = 'https://blooming-eyrie-20291.herokuapp.com/api/getClasses';
    try {
      final res = await http.get(Uri.parse(url));
      final extractedData = json.decode(res.body);
      final List<TableRowData> loadedData = [];
      if (res.statusCode == 400) {
        throw 'errpr';
      }

      extractedData['data'].forEach((value) {
        loadedData.add(TableRowData(
            std: value['class_id'],
            name: value['t_name'],
            chapter: '1',
            presentStudents: '1',
            time: value['time'],
            totalStudents: value['tot_students']));
        _classes = loadedData;
      });
    } catch (e) {
      print(e);
      throw e;
    }
    notifyListeners();
  }

  void changeClassData(
      String std, String newName, String newTime, String newTotalStudents) {
    final prodIndex = _classes.indexWhere((_class) => _class.std == std);
    var oldData = _classes[prodIndex];
    var newData = TableRowData(
        name: newName,
        chapter: oldData.chapter,
        std: oldData.std,
        time: newTime,
        totalStudents: newTotalStudents,
        presentStudents: oldData.presentStudents);
    _classes[prodIndex] = newData;
    notifyListeners();
  }

  void changeAttendence(String std, String newattendance) {
    final prodIndex = _classes.indexWhere((_class) => _class.std == std);
    var oldData = _classes[prodIndex];
    var newData = TableRowData(
        name: oldData.name,
        chapter: oldData.chapter,
        std: oldData.std,
        time: oldData.time,
        totalStudents: oldData.totalStudents,
        presentStudents: newattendance);
    _classes[prodIndex] = newData;
    notifyListeners();
  }

  void changeChapter(String std, String newChapter) {
    final prodIndex = _classes.indexWhere((_class) => _class.std == std);
    var oldData = _classes[prodIndex];
    var newData = TableRowData(
        name: oldData.name,
        chapter: newChapter,
        std: oldData.std,
        time: oldData.time,
        totalStudents: oldData.totalStudents,
        presentStudents: oldData.presentStudents);
    _classes[prodIndex] = newData;
    notifyListeners();
  }
}
