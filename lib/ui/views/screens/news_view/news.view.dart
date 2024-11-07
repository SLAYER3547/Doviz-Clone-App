import 'package:doviz_clone_app/core/models/news_model/news.model.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:doviz_clone_app/ui/views/screens/news_view/news_detail_view.dart';
import 'package:flutter/material.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key, this.appBarTitle});
  final String? appBarTitle;

  @override
  // ignore: library_private_types_in_public_api
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = 0;
  final GlobalKey _categoryKey = GlobalKey();

  List<String> categories = [
    'Tümü',
    'Gündem',
    'Döviz',
    'Borsa',
    'Altın',
    'Kripto Para',
    'Emtia',
  ];

  List<News> newsList = News.newsList;

  List<News> getFilteredNews(int categoryIndex) {
    if (categoryIndex == 0) {
      return newsList;
    }
    return newsList
        .where((news) => news.category == categories[categoryIndex])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: scaffoldAndAppBarBackgroundColor,
        title: widget.appBarTitle == null
            ? const Text(
                'Haberler',
                style: TextStyle(color: defaultTextColor),
              )
            : Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: defaultTextColor,
                      ),),
                  const SizedBox(width: 25,),    
                  Text(
                    widget.appBarTitle!,
                    style: const TextStyle(color: defaultTextColor),
                  ),
                ],
              ),
      ),
      body: Column(
        children: [
          buildCategoryMenu(),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: categories.length,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
                scrollToCategory(index); // Scroll to the selected category
              },
              itemBuilder: (context, index) {
                return buildNewsList(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryMenu() {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                _pageController.animateToPage(
                  selectedIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
              scrollToCategory(index); // Scroll to the selected category
            },
            child: Column(
              children: [
                Padding(
                  key: selectedIndex == index
                      ? _categoryKey
                      : null, // Assign key to the selected category
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color:
                          selectedIndex == index ? Colors.blue : defaultTextColor,
                      fontWeight: selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
                if (selectedIndex == index)
                  Container(
                    height: 2,
                    width: 70,
                    color: Colors.blue,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // Function to scroll the category menu to the selected item
  void scrollToCategory(int index) {
    // Check if the selected category key exists and get its position
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final categoryBox =
          _categoryKey.currentContext?.findRenderObject() as RenderBox?;
      if (categoryBox != null) {
        final categoryPosition = categoryBox.localToGlobal(Offset.zero).dx;
        final screenWidth = MediaQuery.of(context).size.width;

        // Scroll so that the selected category is centered
        final scrollPosition =
            categoryPosition - (screenWidth / 2) + (categoryBox.size.width / 2);
        _scrollController.animateTo(
          scrollPosition.clamp(0.0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Widget buildNewsList(int categoryIndex) {
    final filteredNews = getFilteredNews(categoryIndex);
    return ListView.builder(
      itemCount: filteredNews.length,
      itemBuilder: (context, index) {
        final news = filteredNews[index];
        return ListTile(
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              news.imageUrl,
              fit: BoxFit.cover,
              width: 80,
              height: 150,
            ),
          ),
          title: Text(news.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,),),
          subtitle: Row(
            children: [
              Text(
                news.date,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                news.time,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailPage(
                  newsList: newsList, // Pass all news
                  initialIndex: index, // Pass the selected index
                  selectedCategory:
                      news.category, // Pass the category of the selected news
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
