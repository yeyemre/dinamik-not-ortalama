import 'package:dinamik_not_ortalama/const/constants.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int lessonCount;
  final double average;

  const ResultWidget(
      {Key? key, required this.lessonCount, required this.average})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lessonCount > 0 ? "$lessonCount Ders Girildi" : "Ders Seçiniz...",
          style: Constants.textStyle(
            16,
            FontWeight.w600,
            Theme.of(context).primaryColor,
          ),
        ),
        Text(
          average > 0 ? average.toStringAsFixed(2) : "0.0",
          style: Constants.textStyle(
            55,
            FontWeight.w600,
            Theme.of(context).primaryColor,
          ),
        ),
        Text(
          "Ortalama",
          style: Constants.textStyle(
            16,
            FontWeight.w600,
            Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
