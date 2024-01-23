import 'package:flutter/material.dart';
import 'package:flutter_haber_uygulamasi/extension/media_query_extension.dart';
import 'package:flutter_haber_uygulamasi/models/news_category.dart';
import 'package:flutter_haber_uygulamasi/pages/search_page.dart';
import 'package:flutter_haber_uygulamasi/utils/app_constants.dart';
import 'package:flutter_haber_uygulamasi/viewmodel/article_list_view_model.dart';
import 'package:flutter_haber_uygulamasi/widgets/categories_tab_conteiner.dart';
import 'package:flutter_haber_uygulamasi/widgets/news_page_listview_builder.dart';
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
          style: appBarTitleText(context),
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
          child: CategoriesTabContainer(
              getCategories: categories,
              getSelectedIndex: selectedIndex,
              getIndex: i),
        ),
      );
    }
    return list;
  }

  Widget getWidgetByStatus(ArticleListViewModel vm) {
    switch (vm.status.index) {
      case 2:
        return NewsPageListViewBuilder(getViewModel: vm.viewModel.articles);
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
