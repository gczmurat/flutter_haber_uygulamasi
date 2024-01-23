import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants{
  static final TextStyle appBarTitleText1 = TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.ptSans().fontFamily);
}

TextStyle globalDefaultFieldValueStyle(
  BuildContext context,
) {
  return Theme.of(context)
      .textTheme
      .titleSmall!
      .copyWith(fontSize: 28,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.ptSans().fontFamily,color: Colors.indigo);
}