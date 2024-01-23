import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appBarTitleText(
  BuildContext context,
) {
  return Theme.of(context).textTheme.titleSmall!.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.ptSans().fontFamily,
      color: Colors.indigo);
}

TextStyle appBarDetailPageTitleText(
  BuildContext context,
) {
  return Theme.of(context).textTheme.titleSmall!.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.ptSans().fontFamily,
      color: Colors.white);
}

TextStyle buttonText(
  BuildContext context,
) {
  return Theme.of(context).textTheme.titleSmall!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.blue,
      fontFamily: GoogleFonts.ptSans().fontFamily);
}

TextStyle newsTitleText(
  BuildContext context,
) {
  return Theme.of(context).textTheme.titleSmall!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.black,
      fontFamily: GoogleFonts.ptSans().fontFamily);
}

TextStyle newsContentText(
  BuildContext context,
) {
  return Theme.of(context).textTheme.titleSmall!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.black,
      fontFamily: GoogleFonts.ptSans().fontFamily);
}

TextStyle textFieldHintText(
  BuildContext context,
) {
  return Theme.of(context).textTheme.titleSmall!.copyWith(
      color: Colors.indigo.shade300,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.ptSans().fontFamily);
}
