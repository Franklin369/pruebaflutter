import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/CalcButton.dart';

void main() {
  runApp(const CalcApp());
}




class CalcApp extends StatefulWidget {
  const CalcApp({ super.key});

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor:const Color(0xFFB6C3F6),
        body: Container(
          padding:const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment:const Alignment(1.0, 1.0),
                child: Padding(
                  padding:const  EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle:const TextStyle(
                        fontSize: 24,
                        color: Color(0xFF622EB4),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment:const Alignment(1.0, 1.0),
                child: Padding(
                  padding:const  EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle:const TextStyle(
                        fontSize: 48,
                        color: Color(0xff622EB4),
                      ),
                    ),
                  ),
                ),
              ),
             const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    bgcolor: 0xFF00BF45,
                    text: 'AC',
                    fillColor: 0xFF54C151,
                           textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callback: allClear,
                  ),
                  CalcButton(
                    bgcolor: 0xffE3303A,
                    text: 'C',
                    fillColor: 0xFF6C807F,
                           textColor: 0xFFFFFFFF,
                    callback: clear,
                  ),
                  CalcButton(
                     bgcolor: 0XFF652CB6,
                    text: '%',
                    fillColor: 0xFFFFFFFF,
                         textColor: 0xFFFFFFFF,
                    callback: numClick,
                  ),
                  CalcButton(
                     bgcolor: 0XFF652CB6,
                    text: '/',
                    fillColor: 0xFFFFFFFF,
                         textColor: 0xFFFFFFFF,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    callback: numClick,
                  ),
                  CalcButton(
                    fillColor: 0xFFFFFFFF,
                    text: '8',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '9',
                    callback: numClick,
                  ),
                  CalcButton(
                     bgcolor: 0XFF652CB6,
                    text: '*',
                    fillColor: 0xFFFFFFFF,
                          textColor: 0xFFFFFFFF,
                    textSize: 24,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '5',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '6',
                    callback: numClick,
                  ),
                  CalcButton(

                     bgcolor: 0XFF652CB6,
                    text: '-',
                    fillColor: 0xFFFFFFFF,
                         textColor: 0xFFFFFFFF,
                    textSize: 38,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '1',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '2',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '3',
                    callback: numClick,
                  ),
                  CalcButton(
                     bgcolor: 0XFF652CB6,
                    text: '+',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFFFFFFFF,
                    textSize: 30,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    bgcolor: 0xffEEE4F5,
                          
                    text: '.',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '0',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '00',
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                     bgcolor: 0XFF652CB6,
                    text: '=',
                    fillColor: 0xFFFFFFFF,
                          textColor: 0xFFFFFFFF,
                    callback: evaluate,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
