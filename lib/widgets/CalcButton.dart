import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class name extends StatelessWidget {
  const name({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CalcButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;
  final int bgcolor;

  const CalcButton(
      {super.key,
      required this.text,
      this.fillColor = 0xFFFFFFFF,
      this.textColor = 0xFF622EB4,
      this.textSize = 28,
      required this.callback,
      this.bgcolor =   0xffEEE4F5,});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        
        width: 65,
        height: 65,
        child: TextButton(
          onPressed: () {
            callback(text);
          },
          
          style: TextButton.styleFrom(
            backgroundColor: Color(bgcolor),
            foregroundColor: Color(textColor),
            padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(fontSize: 20)
          ),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
