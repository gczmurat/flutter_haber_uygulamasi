import 'package:flutter/material.dart';
import 'package:flutter_haber_uygulamasi/pages/news_page.dart';
import 'package:flutter_haber_uygulamasi/viewmodel/article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ile Haber Uygulaması',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => ArticleListViewModel(),
          child: const NewsPage(),
        ),
      ),
    );
  }
}
