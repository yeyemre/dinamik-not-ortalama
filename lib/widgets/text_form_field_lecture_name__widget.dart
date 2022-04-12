import 'package:flutter/material.dart';

class TextFormFieldLectureNameWidget extends StatefulWidget {
  final Function onTextFormFieldSaved;

  const TextFormFieldLectureNameWidget(
      {Key? key, required this.onTextFormFieldSaved})
      : super(key: key);

  @override
  State<TextFormFieldLectureNameWidget> createState() =>
      TextFormFieldLectureNameWidgetState();
}

class TextFormFieldLectureNameWidgetState
    extends State<TextFormFieldLectureNameWidget> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      onSaved: (String? value) {
        widget.onTextFormFieldSaved(value);
      },
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Ders Adı Alanı Boş Olamaz!";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Lütfen Ders Adını Girin... ",
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).primaryColor.withOpacity(0.3),
      ),
    );
  }

  void textFormFieldLectureNameClear() {
    _textEditingController.clear();
  }
}
