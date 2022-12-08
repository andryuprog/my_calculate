


import 'package:flutter/material.dart';

class HistoryButton extends StatelessWidget {
  final String? text;
  final Color? fillColor;
  final Color? textColor;
  final double? textSize;
  final VoidCallback? callback;


  const HistoryButton ({super.key,
    this.text,
    this.fillColor,
    this.textColor,
    this.textSize,
    this.callback,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      width: double.infinity,
      height: 70,
      child: MaterialButton(
        color: fillColor ?? Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed:callback,
        child: Text (
          text!,
          style: TextStyle(
            fontSize: textSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

}
