import 'package:flutter/material.dart';
import 'package:flutter_haber_uygulamasi/models/articles.dart';
import 'package:flutter_haber_uygulamasi/pages/news_detail_page.dart';
import 'package:google_fonts/google_fonts.dart';

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
        toolbarHeight: 35,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.indigo,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bir Haber Arayın",
              style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.ptSans().fontFamily),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: updateList,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.indigo.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Ara",
                hintStyle: TextStyle(
                    color: Colors.indigo.shade300,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.ptSans().fontFamily),
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.indigo.shade400,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NewsDetailPage(
                            title: filteredList[index].title.toString(),
                            description: filteredList[index].content.toString(),
                            newsDate:
                                filteredList[index].publishedAt.toString(),
                            author: filteredList[index].author.toString(),
                            imageUrl: filteredList[index].urlToImage.toString(),
                          ),
                        ));
                      },
                      title: Text(
                        filteredList[index].title ?? "",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.ptSans().fontFamily,
                        ),
                      ),
                      subtitle: Text(
                        "${filteredList[index].publishedAt?.substring(11, 16)}  ${filteredList[index].publishedAt?.substring(0, 10)}" ??
                            "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: GoogleFonts.ptSans().fontFamily,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.indigo,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
