import 'package:dinamik_not_ortalama/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../helper/data_helper.dart';
import '../models/lesson.dart';

class ListViewLessonsWidget extends StatefulWidget {
  final Function onListViewLessonsDismissed;

  const ListViewLessonsWidget(
      {Key? key, required this.onListViewLessonsDismissed})
      : super(key: key);

  @override
  State<ListViewLessonsWidget> createState() => ListViewLessonsWidgetState();
}

class ListViewLessonsWidgetState extends State<ListViewLessonsWidget> {
  final ItemScrollController _itemScrollController = ItemScrollController();

  List<Lesson> _listLesson = [];
  int _listCount = 0;

  @override
  Widget build(BuildContext context) {
    _listLesson = DataHelper.getLesson();
    _listCount = _listLesson.length;
    return _listCount == 0
        ? Center(
            child: Text(
              "Henüz Ders Eklenmemiş...",
              style: Constants.textStyle(
                  22, FontWeight.w600, Theme.of(context).primaryColor),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ScrollablePositionedList.builder(
                itemScrollController: _itemScrollController,
                itemCount: _listCount,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: UniqueKey(),
                    child: Card(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                      child: ListTile(
                        leading: CircleAvatar(
                          child:
                              Text(_listLesson[index].letterGrade.toString()),
                        ),
                        title: Text("Ders Adı: ${_listLesson[index].name}"),
                        subtitle:
                            Text("Ders Kredisi: ${_listLesson[index].credit}"),
                      ),
                    ),
                    onDismissed: (direction) {
                      widget.onListViewLessonsDismissed(index);
                    },
                  );
                }),
          );
  }

  void scrollListViewToBottom() {
    _itemScrollController.scrollTo(
      index: _listCount + 1,
      duration: const Duration(microseconds: 300),
    );
  }
}
