import 'package:flutter/material.dart';
import 'package:flutter_haber_uygulamasi/models/articles.dart';
import 'package:flutter_haber_uygulamasi/pages/news_detail_page.dart';
import 'package:flutter_haber_uygulamasi/utils/app_constants.dart';
import 'package:flutter_haber_uygulamasi/utils/constants_design.dart';

class NewsPageListViewBuilder extends StatelessWidget {
  final List<Articles> getViewModel;
  const NewsPageListViewBuilder({super.key, required this.getViewModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: ListView.builder(
          itemCount: getViewModel.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Image.network(getViewModel[index].urlToImage ??
                        defaultImageUrl),
                    ListTile(
                      title: Text(
                        getViewModel[index].title ?? "",
                        style: newsTitleText(context),
                      ),
                      subtitle: Text(
                        "${getViewModel[index].publishedAt?.substring(11, 16)}  ${getViewModel[index].publishedAt?.substring(0, 10)}" ??
                            "",
                        style: newsContentText(context),
                      ),
                    ),
                    ButtonBar(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NewsDetailPage(
                                title: getViewModel[index].title ?? "",
                                description:
                                    getViewModel[index].content ?? "",
                                newsDate:
                                    getViewModel[index].publishedAt ??
                                        "",
                                author:
                                    getViewModel[index].author ?? "",
                                imageUrl:
                                    getViewModel[index].urlToImage ??
                                        "",
                              ),
                            ));
                          },
                          child: Text(
                            "Haberin Devamı",
                            style: buttonText(context),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}