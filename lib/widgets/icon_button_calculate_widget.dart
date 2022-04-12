import 'package:flutter/material.dart';

class IconButtonCalculateWidget extends StatefulWidget {
  final Function onIconButtonPressed;

  const IconButtonCalculateWidget({Key? key, required this.onIconButtonPressed})
      : super(key: key);

  @override
  State<IconButtonCalculateWidget> createState() =>
      _IconButtonCalculateWidgetState();
}

class _IconButtonCalculateWidgetState extends State<IconButtonCalculateWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_forward_ios_sharp,
      ),
      color: Theme.of(context).primaryColor,
      iconSize: 38,
      onPressed: () => widget.onIconButtonPressed(),
    );
  }
}
