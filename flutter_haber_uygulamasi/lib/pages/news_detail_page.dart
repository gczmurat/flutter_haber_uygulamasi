import 'package:flutter/material.dart';
import 'package:flutter_haber_uygulamasi/utils/app_constants.dart';
import 'package:flutter_haber_uygulamasi/utils/constants_design.dart';

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
          "News Details",
          style: appBarDetailPageTitleText(context),
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
              style: newsTitleText(context),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${widget.newsDate.substring(11, 16)}  ${widget.newsDate.substring(0, 10)}" ??
                      "",
                  style: newsContentText(context),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kSymetricPadding, vertical: kSymetricPadding),
            child: Text(
              widget.description,
              style: newsContentText(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: kSymetricPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.author,
                  style: newsContentText(context),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
