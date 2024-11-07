import 'package:doviz_clone_app/core/models/article_model/article_model.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:doviz_clone_app/ui/views/menu_view/pages/article_views/article_detail_view.dart';
import 'package:flutter/material.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({super.key});

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  TextEditingController searchArticleController = TextEditingController();
  List<ArticleList> articleList = ArticleList.articleList;
  List<ArticleList> filteredArticles = [];

  @override
  void initState() {
    super.initState();
    filteredArticles = articleList;

    searchArticleController.addListener(() {
      setState(() {
        filteredArticles = articleList
            .where(
              (article) => article.articleTitle
                  .toLowerCase()
                  .contains(searchArticleController.text.toLowerCase()),
            )
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: scaffoldAndAppBarBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: iconColor,
                size: 24,
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 10 * 8,
              decoration: BoxDecoration(
                color: systemMainGreyColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: TextField(
                controller: searchArticleController,
                cursorColor: systemBlueColor,
                style: const TextStyle(color: defaultTextColor),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: iconColor),
                  suffixIcon: searchArticleController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(
                            Icons.close_rounded,
                            color: systemGreyColor,
                          ),
                          onPressed: () {
                            searchArticleController.clear();
                          },
                        )
                      : null,
                  hintText: 'Makale Arayın',
                  hintStyle: const TextStyle(color: iconColor),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      body: filteredArticles.isEmpty
          ? const SizedBox.shrink()
          : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleDetailView(
                            articleImage: filteredArticles[0].articleImage,
                            articleTitle: filteredArticles[0].articleTitle,
                            articleDate: filteredArticles[0].articleDate,
                            articleTime: filteredArticles[0].articleTime,
                            readingTime: filteredArticles[0].readingTime,
                            articleContent: filteredArticles[0].articleContent,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 10 * 9.5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                filteredArticles[0].articleImage,
                                height: 200,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ÖNE ÇIKAN MAKALE',
                                style: TextStyle(
                                  color: Color(0xFF98a2ac),
                                  fontSize: 16,
                                  letterSpacing: 4,
                                ),
                              ),
                              Text(
                                filteredArticles[0].articleTitle,
                                style: const TextStyle(
                                  color: defaultTextColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '${filteredArticles[0].articleDate} ${filteredArticles[0].articleTime}',
                                style:
                                    const TextStyle(color: Color(0xFFc8ccd1)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ListTile(
                        title: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticleDetailView(
                                  articleImage:
                                      filteredArticles[index + 1].articleImage,
                                  articleTitle:
                                      filteredArticles[index + 1].articleTitle,
                                  articleDate:
                                      filteredArticles[index + 1].articleDate,
                                  articleTime:
                                      filteredArticles[index + 1].articleTime,
                                  readingTime:
                                      filteredArticles[index + 1].readingTime,
                                  articleContent: filteredArticles[index + 1]
                                      .articleContent,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 10 * 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    filteredArticles[index + 1].articleImage,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        10 *
                                        5.5,
                                    child: Text(
                                      filteredArticles[index + 1].articleTitle,
                                      style: const TextStyle(
                                        color: Color(0xFFf5f5f5),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${filteredArticles[index + 1].articleDate} ${filteredArticles[index + 1].articleTime}',
                                    style: const TextStyle(
                                      color: Color(0xFFc7cbce),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: filteredArticles.length - 1,
                  ),
                ),
              ],
            ),
    );
  }
}
