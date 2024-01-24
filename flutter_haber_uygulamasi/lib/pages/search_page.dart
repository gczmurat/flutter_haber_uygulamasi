import 'package:flutter/material.dart';
import 'package:flutter_haber_uygulamasi/extension/media_query_extension.dart';
import 'package:flutter_haber_uygulamasi/models/articles.dart';
import 'package:flutter_haber_uygulamasi/utils/app_constants.dart';
import 'package:flutter_haber_uygulamasi/utils/constants_design.dart';
import 'package:flutter_haber_uygulamasi/widgets/search_page_listview_builder.dart';

class SearchPage extends StatefulWidget {
  final List<Articles> list;
  const SearchPage({super.key, required this.list});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<Articles> filteredList;

  @override
  void initState() {
    super.initState();
    filteredList = List.from(widget.list);
  }

  void updateList(String value) {
    setState(() {
      filteredList = widget.list
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Search For News",
          style: appBarTitleText(context),
        ),
        toolbarHeight: context.height * 0.06,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.indigo,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.height * 0.01,
            ),
            SingleChildScrollView(
              child: TextField(
                onChanged: updateList,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.indigo.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kDefaultRadius),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search",
                  hintStyle: textFieldHintText(context),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.indigo.shade400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
            SearchPageListViewBuilder(getFiltredList: filteredList)
          ],
        ),
      ),
    );
  }
}
