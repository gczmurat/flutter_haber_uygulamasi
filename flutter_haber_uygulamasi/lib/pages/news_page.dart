import 'package:flutter/material.dart';
import 'package:flutter_haber_uygulamasi/extension/media_query_extension.dart';
import 'package:flutter_haber_uygulamasi/models/news_category.dart';
import 'package:flutter_haber_uygulamasi/pages/news_detail_page.dart';
import 'package:flutter_haber_uygulamasi/pages/search_page.dart';
import 'package:flutter_haber_uygulamasi/utils/app_constants.dart';
import 'package:flutter_haber_uygulamasi/utils/constants_design.dart';
import 'package:flutter_haber_uygulamasi/viewmodel/article_list_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int selectedIndex = 0;
  List<NewsCategory> categories = [
    NewsCategory('Gündem', 'general'),
    NewsCategory('Eğlence', 'entertainment'),
    NewsCategory('İş', 'business'),
    NewsCategory('Sağlık', 'health'),
    NewsCategory('Bilim', 'science'),
    NewsCategory('Spor', 'sports'),
    NewsCategory('Teknoloji', 'technology'),
  ];

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchPage(
                    list: vm.viewModel.articles,
                  ),
                ));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.indigo,
                size: 30,
              ))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Haberler",
          style: globalDefaultFieldValueStyle(context),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: context.height * 0.07,
            width: context.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getCategoriesTab(vm),
            ),
          ),
          getWidgetByStatus(vm)
        ],
      ),
    );
  }

  List<GestureDetector> getCategoriesTab(ArticleListViewModel vm) {
    List<GestureDetector> list = [];
    for (int i = 0; i < categories.length; i++) {
      list.add(
        GestureDetector(
          onTap: () {
            vm.getNews(categories[i].category);
            setState(() {
              selectedIndex = i;
            });
          },
          child: Container(
            color: selectedIndex == i ? Colors.transparent : Colors.indigo,
            child: Padding(
              padding: const EdgeInsets.all(kDefaultNormalPadding),
              child: Center(
                child: Text(
                  categories[i].key.toUpperCase(),
                  style: selectedIndex == i
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
          ),
        ),
      );
    }
    return list;
  }

  Widget getWidgetByStatus(ArticleListViewModel vm) {
    switch (vm.status.index) {
      case 2:
        return Expanded(
            child: ListView.builder(
          itemCount: vm.viewModel.articles.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Image.network(vm.viewModel.articles[index].urlToImage ??
                        "https://peoplevine.blob.core.windows.net/media/72/e86f3854-ebcf-4025-ae66-220b51f77ec2/image_not_available.png"),
                    ListTile(
                      title: Text(
                        vm.viewModel.articles[index].title ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: GoogleFonts.ptSans().fontFamily,
                        ),
                      ),
                      subtitle: Text(
                        "${vm.viewModel.articles[index].publishedAt?.substring(11, 16)}  ${vm.viewModel.articles[index].publishedAt?.substring(0, 10)}" ??
                            "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: GoogleFonts.ptSans().fontFamily,
                        ),
                      ),
                    ),
                    ButtonBar(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NewsDetailPage(
                                title: vm.viewModel.articles[index].title ?? "",
                                description:
                                    vm.viewModel.articles[index].content ?? "",
                                newsDate:
                                    vm.viewModel.articles[index].publishedAt ??
                                        "",
                                author:
                                    vm.viewModel.articles[index].author ?? "",
                                imageUrl:
                                    vm.viewModel.articles[index].urlToImage ??
                                        "",
                              ),
                            ));
                          },
                          child: Text(
                            "Haberin Devamı",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue,
                              fontFamily: GoogleFonts.ptSans().fontFamily,
                            ),
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
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
