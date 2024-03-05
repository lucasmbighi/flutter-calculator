import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Color color;
  final int flex;
  final Function() onPressed;

  const Button(
      {super.key,
      required this.title,
      required this.color,
      this.flex = 1,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: color,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
