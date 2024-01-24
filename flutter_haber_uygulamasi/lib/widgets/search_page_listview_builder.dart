import 'package:flutter/material.dart';
import 'package:flutter_haber_uygulamasi/models/articles.dart';
import 'package:flutter_haber_uygulamasi/pages/news_detail_page.dart';
import 'package:flutter_haber_uygulamasi/utils/app_constants.dart';
import 'package:flutter_haber_uygulamasi/utils/constants_design.dart';

class SearchPageListViewBuilder extends StatelessWidget {
  final List<Articles> getFiltredList;
  const SearchPageListViewBuilder({super.key, required this.getFiltredList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: getFiltredList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.indigo),
              borderRadius: BorderRadius.circular(kDefaultRadius),
            ),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NewsDetailPage(
                    title: getFiltredList[index].title.toString(),
                    description: getFiltredList[index].content.toString(),
                    newsDate: getFiltredList[index].publishedAt.toString(),
                    author: getFiltredList[index].author.toString(),
                    imageUrl: getFiltredList[index].urlToImage.toString() ?? defaultImageUrl,
                  ),
                ));
              },
              title: Text(
                getFiltredList[index].title ?? "",
                style: newsContentText(context),
              ),
              subtitle: Text(
                "${getFiltredList[index].publishedAt?.substring(11, 16)}  ${getFiltredList[index].publishedAt?.substring(0, 10)}" ??
                    "",
                style: newsContentText(context),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.indigo,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
