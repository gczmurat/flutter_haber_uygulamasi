import 'package:flutter/material.dart';
import 'package:flutter_haber_uygulamasi/models/news_category.dart';
import 'package:flutter_haber_uygulamasi/utils/constants_design.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CategoriesTabContainer extends StatelessWidget {
  int getIndex;
  int getSelectedIndex;
  List<NewsCategory> getCategories;
  CategoriesTabContainer(
      {super.key,
      required this.getCategories,
      required this.getSelectedIndex,
      required this.getIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getSelectedIndex == getIndex ? Colors.transparent : Colors.indigo,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultNormalPadding),
        child: Center(
          child: Text(
            getCategories[getIndex].key.toUpperCase(),
            style: getSelectedIndex == getIndex
                ? TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.ptSans().fontFamily)
                : TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.ptSans().fontFamily),
          ),
        ),
      ),
    );
  }
}
