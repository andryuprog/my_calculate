import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget{
  final String? text;
  final Color? fillColor;
  final Color? textColor;
  final double? textSize;
  final Function ? callback;

  const CalculatorButton ({super.key,
    this.text,
    this.fillColor,
    this.textColor,
    this.textSize,
    this.callback,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: MaterialButton(
          color: fillColor ?? Colors.orange,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Text(
            text!,
            style: TextStyle(
              fontSize: textSize,
              color: Colors.white,
            ),
          ),
          onPressed: () => callback!(text),
        ),
      ),
    );
  }
}