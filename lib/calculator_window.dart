import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/Components/button.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorWindow extends StatefulWidget {
  @override
  _CalculatorWindowState createState() => _CalculatorWindowState();
}

class _CalculatorWindowState extends State<CalculatorWindow> {
  List colors = <Color>[
    Color(0xffCCCCCC),
    Color(0xff87CEEB),
    Color(0xff333333),
    Color(0xffFFA500),
    Color(0xff800000),
    Color(0xff666666),
    Color(0xff40E0D0),
    Color(0xff4682B4),
    Color(0xffBC8F8F),
    Color(0xffFF9900),
    Color(0xffCD5C5C),
    Color(0xff2E8B57),
  ]..shuffle();

  int index = 0;

  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClearClick(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clearClick(String text) {
    setState(() {
      _expression = '';
    });
  }
  void clearButtonOneNumber(String text){
   setState(() {
     _expression = _expression.substring(0, _expression.length-1);
   });
  }

  void result(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[index],
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Container(
          constraints: BoxConstraints.expand(),
          margin: EdgeInsets.all(20),
          child: ClayContainer(
            color: colors[index],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 12),
                  alignment: Alignment.bottomRight,
                  child: ClayText(
                    _history,
                    color: colors[index],
                    size: 15,
                    emboss: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 12, top: 12, left: 12),
                  alignment: Alignment.bottomRight,
                  child: ClayText(
                    _expression,
                    color: colors[index],
                    size: 40,
                    emboss: true,
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CalculatorButton(
                      text: 'AC',
                      color: colors[index],
                      onTap: allClearClick,
                    ),
                    CalculatorButton(
                      text: '<',
                      color: colors[index],
                      onTap: clearButtonOneNumber,
                    ),
                    CalculatorButton(
                      text: '/',
                      color: colors[index],
                      onTap: numClick,
                    ),
                    CalculatorButton(
                      text: '*',
                      color: colors[index],
                      onTap: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CalculatorButton(
                      text: '7',
                      color: colors[index],
                      onTap: numClick,
                    ),
                    CalculatorButton(
                      text: '8',
                      color: colors[index],
                      onTap: numClick,
                    ),
                    CalculatorButton(
                      text: '9',
                      color: colors[index],
                      onTap: numClick,
                    ),
                    CalculatorButton(
                      text: '-',
                      color: colors[index],
                      onTap: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CalculatorButton(
                      text: '4',
                      color: colors[index],
                      onTap: numClick,
                    ),
                    CalculatorButton(
                      text: '5',
                      color: colors[index],
                      onTap: numClick,
                    ),
                    CalculatorButton(
                      text: '6',
                      color: colors[index],
                      onTap: numClick,
                    ),
                    CalculatorButton(
                      text: '+',
                      color: colors[index],
                      onTap: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CalculatorButton(
                      text: '1',
                      color: colors[index],
                      onTap: numClick,
                    ),
                    CalculatorButton(
                      text: '2',
                      color: colors[index],
                      onTap: numClick,
                    ),
                    CalculatorButton(
                      text: '3',
                      color: colors[index],
                      onTap: numClick,
                    ),
                    CalculatorButton(
                      text: '.',
                      color: colors[index],
                      onTap: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CalculatorButton(
                      text: '(',
                      color: colors[index],
                      onTap: numClick,
                    ),
                    CalculatorButton(
                      text: '0',
                      color: colors[index],
                      onTap: numClick,
                    ),
                    CalculatorButton(
                      text: ')',
                      color: colors[index],
                      onTap: numClick,
                    ),
                    CalculatorButton(
                      text: '=',
                      color: colors[index],
                      onTap: result,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
