import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter_calculator/calculator_window.dart';

class CalculatorButton extends StatelessWidget {
  CalculatorButton({this.onTap, this.text, this.color});
  final String text;
  final Function onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, top: 12, bottom: 12),
      child: SizedBox(
        width: 70,
        height: 40,
        child: FlatButton(
            onPressed: (){
              onTap(text);
            },
            child: ClayText(
              text, emboss: true, size: 29, color: color),
            ),
        ),
    );
  }
}
