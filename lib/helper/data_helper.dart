import 'package:dinamik_not_ortalama/const/constants.dart';
import 'package:dinamik_not_ortalama/models/lesson.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static final List<Lesson> _listLesson = <Lesson>[];

  static void addLesson(Lesson lesson) {
    _listLesson.add(lesson);
  }

  static void removeLesson(int index) {
    _listLesson.removeAt(index);
  }

  static List<Lesson> getLesson() {
    return _listLesson;
  }

  static List<String> _generateLetterGrade() {
    return <String>[
      "AA",
      "BA",
      "BB",
      "CB",
      "CC",
      "DC",
      "DD",
      "FD",
      "FF",
    ];
  }

  static double _convertLetterGradeToDouble(String letter) {
    switch (letter) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2.0;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1.0;
      case 'FD':
        return 0.5;
      default:
        return 0;
    }
  }

  static List<DropdownMenuItem<double>> getLetterGrade() {
    return _generateLetterGrade().map((String letterGrade) {
      return DropdownMenuItem(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            letterGrade.toString(),
            style: Constants.textStyle(16, FontWeight.w500, Colors.brown),
          ),
        ),
        value: _convertLetterGradeToDouble(letterGrade),
      );
    }).toList();
  }

  static List<int> _generateListCredit() {
    return List.generate(10, (index) => index + 1);
  }

  static List<DropdownMenuItem<int>> getListCredit() {
    return _generateListCredit().map((int credit) {
      return DropdownMenuItem<int>(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            credit.toString(),
            style: Constants.textStyle(16, FontWeight.w500, Colors.brown),
          ),
        ),
        value: credit,
      );
    }).toList();
  }

  static Map<String, dynamic> getResults() {
    int _totalLessonCount = _listLesson.length;
    double _totalNote = 0;
    int _totalCredits = 0;

    for (Lesson lesson in _listLesson) {
      _totalCredits += lesson.credit;
      _totalNote += lesson.credit * lesson.letterGrade;
    }

    double _average = _totalNote / _totalCredits;

    return {
      "totalLessonsCount": _totalLessonCount,
      "average": _average,
    };
  }
}
