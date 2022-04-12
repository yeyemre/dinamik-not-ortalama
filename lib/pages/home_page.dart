import 'package:dinamik_not_ortalama/const/constants.dart';
import 'package:dinamik_not_ortalama/helper/data_helper.dart';
import 'package:dinamik_not_ortalama/models/lesson.dart';
import 'package:dinamik_not_ortalama/widgets/drop_down_creadit_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/drop_down_letter_grade_widget.dart';
import '../widgets/icon_button_calculate_widget.dart';
import '../widgets/list_view_lessons_widget.dart';
import '../widgets/result_widget.dart';
import '../widgets/text_form_field_lecture_name__widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textFormFieldKey = GlobalKey<FormState>();
  final _listViewLessonKey = GlobalKey<ListViewLessonsWidgetState>();
  final _textFormFieldLectureNameKey =
      GlobalKey<TextFormFieldLectureNameWidgetState>();
  String _lessonName = "";
  double _dropDownLetterGradeValue = 2.0;
  int _dropDownCreditValue = 5;
  double _lessonsAverage = 0;
  int _totalLessonsCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          Constants.appBarTitle,
          style: Constants.titleStyle,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return orientation == Orientation.portrait
              ? _isOrientationPortrait(context)
              : _isOrientationLandscape(context);
        },
      ),
    );
  }

  Widget _isOrientationPortrait(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ÜST KISIM
        Expanded(
          flex: 1,
          // ÜST KISMI SARMALAYAN CONTAINER
          child: Container(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            padding: const EdgeInsets.only(bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // FORM BÖLÜMÜ
                Expanded(
                  flex: 3,
                  child: _getFormWidgets(context),
                ),
                // SONUÇLARIN GÖSTERİLDİĞİ BÖLÜM
                Expanded(
                  flex: 2,
                  child: _getResultWidget(context),
                ),
              ],
            ),
          ),
        ),
        // ALT KISIM
        Expanded(
          flex: 4,
          // ALT KISMI SARMALAYAN CONTAINER
          child: _listViewLessons(),
        ),
      ],
    );
  }

  Widget _isOrientationLandscape(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // SOL KISIM FORM VE SONUÇ BÖLÜMÜ
        Expanded(
          flex: 2,
          // SOL KISMI SARMALAYAN CONTAINER
          child: Container(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // FORM BÖLÜMÜ
                Expanded(
                  child: Container(
                    child: _getFormWidgets(context),
                  ),
                ),

                // SONUÇLARIN GÖSTERİLDİĞİ BÖLÜM
                Expanded(child: Container(child: _getResultWidget(context))),
              ],
            ),
          ),
        ),
        // DERSLER LİSTESİ OLAN ALT KISIM
        Expanded(
          flex: 3,
          child: _listViewLessons(),
        ),
      ],
    );
  }

  Widget _getFormWidgets(BuildContext context) {
    return Form(
      key: _textFormFieldKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TEXTFORMFIELD WIDGET
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.all(8),
              child: TextFormFieldLectureNameWidget(
                  key: _textFormFieldLectureNameKey,
                  onTextFormFieldSaved: (String value) {
                    _lessonName = value;
                  }),
            ),
          ),
          // DROPDOWNBUTTON BAR
          Expanded(
            flex: 2,
            child: Row(
              children: [
                // DROPDOWNBUTTON LETTER GRADE
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                    ),
                    child: DropDownLetterGradeWidget(
                        onDropDownLetterGradeChanged: (double? value) {
                      setState(() {
                        _dropDownLetterGradeValue = value!;
                      });
                    }),
                  ),
                ),
                // DROPDOWNBUTTON CREDİT
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                    ),
                    child: DropDownCreditWidget(
                        onDropDownCreditChanged: (int? newValue) {
                      setState(() {
                        _dropDownCreditValue = newValue!;
                      });
                    }),
                  ),
                ),
                // ICONBUTTON CALCULATE
                Expanded(
                  flex: 1,
                  child: IconButtonCalculateWidget(
                      onIconButtonPressed: _onIconButtonPressed),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getResultWidget(BuildContext context) {
    return ResultWidget(
        average: _lessonsAverage, lessonCount: _totalLessonsCount);
  }

  Widget _listViewLessons() {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      child: ListViewLessonsWidget(
          key: _listViewLessonKey,
          onListViewLessonsDismissed: (int? index) {
            setState(() {
              DataHelper.removeLesson(index!);
              _totalLessonsCount = DataHelper.getResults()["totalLessonsCount"];
              _lessonsAverage = DataHelper.getResults()["average"];
            });
          }),
    );
  }

  void _onIconButtonPressed() {
    if (_textFormFieldKey.currentState!.validate()) {
      _textFormFieldKey.currentState!.save();

      DataHelper.addLesson(Lesson(
          name: _lessonName,
          letterGrade: _dropDownLetterGradeValue,
          credit: _dropDownCreditValue));

      setState(() {
        _totalLessonsCount = DataHelper.getResults()["totalLessonsCount"];
        _lessonsAverage = DataHelper.getResults()["average"];
      });

      // ListViewLessonsWidget SINIFINDAKİ scrollListViewToBottom METODU ÇAĞIRILIYOR
      // EKLENEN HER YENİ DERS İLE LİSTENİN EN SONA GİTMESİ SAĞLANIYOR.
      try {
        _listViewLessonKey.currentState?.scrollListViewToBottom();
      } catch (e) {}

      // TextFormFieldLectureNameWidget SINIFINDAKİ textFormFieldLectureNameClear METODU ÇAĞIRILIYOR
      // EKLENEN HER YENİ DERS İLE TEXTFORMFIELD WIDGET CLEAR YAPILIYOR.
      _textFormFieldLectureNameKey.currentState
          ?.textFormFieldLectureNameClear();
    }
  }
}
