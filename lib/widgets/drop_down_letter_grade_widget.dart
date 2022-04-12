import 'package:dinamik_not_ortalama/helper/data_helper.dart';
import 'package:flutter/material.dart';

class DropDownLetterGradeWidget extends StatefulWidget {
  final Function onDropDownLetterGradeChanged;

  const DropDownLetterGradeWidget(
      {Key? key, required this.onDropDownLetterGradeChanged})
      : super(key: key);

  @override
  State<DropDownLetterGradeWidget> createState() =>
      _DropDownLetterGradeWidgetState();
}

class _DropDownLetterGradeWidgetState extends State<DropDownLetterGradeWidget> {
  double _dropDownLetterGradeValue = 2.0;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<double>(
        items: DataHelper.getLetterGrade(),
        value: _dropDownLetterGradeValue,
        underline: Container(),
        iconEnabledColor: Theme.of(context).primaryColor.withOpacity(0.7),
        onChanged: (double? newValue) {
          _dropDownLetterGradeValue = newValue!;
          widget.onDropDownLetterGradeChanged(newValue);
        });
  }
}
