import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size, [Color? color, FontWeight? fw]) {
  return GoogleFonts.montserrat(fontSize: size, color: color, fontWeight: fw);
}

List selectableTimes = [
  '300', // divide by 60 seconds = 5 minutes
  '600', // 10 min
  '900', // 15 min
  '1200', // 20 min
  '1500', // 25 min
  '1800', // 30 min
  '2100', // 35 min
  '2400', // 40 min
  '2700', // 45 min
  '3000', // 50 min
];

Color renderColor(String currentState) {
  if (currentState == 'FOCUS') {
    return Colors.redAccent;
  } else {
    return Colors.lightBlueAccent;
  }
}
