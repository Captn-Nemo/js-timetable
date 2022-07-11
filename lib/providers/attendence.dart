import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:js_timetable/models/PreviousAttModel.dart';
import '../models/attendence.dart';
import 'package:http/http.dart' as http;

class ClassAttendence with ChangeNotifier {
  List<Attendence> _attendences = [];

  String selectedClass = '1';

  PreviosAttModel get submittedAttendence {
    List<Attendence> data =
        _attendences.where((att) => att.classId == selectedClass).toList();
    return PreviosAttModel(selectedClass, data);
  }

  void updateClass(String newVal) {
    selectedClass = newVal;
    notifyListeners();
  }

  String get getClass {
    if (selectedClass == null)
      return 'false';
    else {
      return selectedClass;
    }
  }

  Future<void> fetchAndStoreAttendance() async {
    const url = 'https://blooming-eyrie-20291.herokuapp.com/api/getAll';
    try {
      final res = await http.get(Uri.parse(url));
      final extractedData = json.decode(res.body);
      final List<Attendence> loadedData = [];
      if (res.statusCode == 400) {
        throw 'error';
      }

      extractedData['data'].forEach((value) {
        loadedData.add(Attendence(
            value['class_id'], value['p_num'], value['day'], value['chapter']));
        _attendences = loadedData;
      });
    } catch (e) {
      print(e);
      throw e;
    }
    notifyListeners();
  }
}
