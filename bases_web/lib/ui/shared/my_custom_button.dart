import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    Key? key,
    required this.onPress,
    required this.title,
    this.textColor = Colors.red,
  }) : super(key: key);

  final void Function() onPress;
  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(color: textColor),
          ),
        ));
  }
}
