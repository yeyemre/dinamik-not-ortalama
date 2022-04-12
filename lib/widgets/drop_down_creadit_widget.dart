import 'package:dinamik_not_ortalama/helper/data_helper.dart';
import 'package:flutter/material.dart';

class DropDownCreditWidget extends StatefulWidget {
  final Function onDropDownCreditChanged;

  const DropDownCreditWidget({Key? key, required this.onDropDownCreditChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropDownCreditWidgetState();
}

class _DropDownCreditWidgetState extends State<DropDownCreditWidget> {
  int _dropDownCreditValue = 5;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
        items: DataHelper.getListCredit(),
        value: _dropDownCreditValue,
        underline: Container(),
        iconEnabledColor: Theme.of(context).primaryColor.withOpacity(0.7),
        onChanged: (int? newValue) {
          _dropDownCreditValue = newValue!;
          widget.onDropDownCreditChanged(newValue);
        });
  }
}
