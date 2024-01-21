import 'package:flutter/material.dart';
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
            icon: Icon(
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
      body: Center(
        child: Text(widget.title),
      ),
    );
  }
}
