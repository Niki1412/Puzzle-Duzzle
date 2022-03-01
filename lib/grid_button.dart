import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  final Function click;
  final String text;

  GridButton(
    this.text,
    this.click,
  );

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      onPressed: () => click(),
    );
  }
}
