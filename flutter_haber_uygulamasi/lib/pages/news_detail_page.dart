import 'package:flutter/material.dart';
import 'package:flutter_haber_uygulamasi/utils/constants_design.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String newsDate;
  final String author;
  final String imageUrl;
  const NewsDetailPage(
      {super.key,
      required this.title,
      required this.description,
      required this.newsDate,
      required this.author,
      required this.imageUrl});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Haberin Detayı",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.ptSans().fontFamily),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kDefaultRadius),
              child: Image.network(widget.imageUrl),
            ),
          ),
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
                fontFamily: GoogleFonts.ptSans().fontFamily,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${widget.newsDate.substring(11, 16)}  ${widget.newsDate.substring(0, 10)}" ??
                      "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ptSans().fontFamily,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSymetricPadding, vertical: kSymetricPadding),
            child: Expanded(
                child: Text(
              widget.description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
                fontFamily: GoogleFonts.ptSans().fontFamily,
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: kSymetricPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text(widget.author,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: GoogleFonts.ptSans().fontFamily,
                  ),)],
            ),
          )
        ],
      ),
    );
  }
}
