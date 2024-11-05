import 'package:doviz_clone_app/models/news_model/news.model.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({
    required this.newsList,
    required this.initialIndex,
    required this.selectedCategory,
    super.key,
  });
  final List<News> newsList;
  final int initialIndex;
  final String selectedCategory;

  @override
  // ignore: library_private_types_in_public_api
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  PageController _pageController = PageController();
  int currentIndex = 0;
  late List<News> filteredNewsList;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;

    filteredNewsList = widget.newsList
        .where((news) => news.category == widget.selectedCategory)
        .toList();

    _pageController = PageController(initialPage: currentIndex);
  }

  List<Widget> _buildPageIndicators() {
    final totalNews = filteredNewsList.length;
    const maxDots = 5;

    final indicators = <Widget>[];
    const middleIndex = maxDots ~/ 2;

    if (totalNews > 0) {
      final startIndex =
          (currentIndex - middleIndex).clamp(0, totalNews - maxDots);
      final endIndex = (startIndex + maxDots - 1).clamp(0, totalNews - 1);

      for (var i = startIndex; i <= endIndex; i++) {
        double size;
        Color color;

        if (i == currentIndex) {
          // Active news (blue dot in the center)
          size = 6.0;
          color = const Color(0xFF0b64c5); // Blue
        } else if ((i - currentIndex).abs() == 1) {
          // Dots next to the blue dot (white)
          size = 4.0;
          color = Colors.white;
        } else {
          // Dots far from the blue dot (grey)
          size = 2.0;
          color = Colors.white;
        }

        indicators.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: CircleAvatar(
              radius: size,
              backgroundColor: color,
            ),
          ),
        );
      }
    }

    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPageIndicators(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {
              // Share functionality
            },
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: filteredNewsList.length,
        itemBuilder: (context, index) {
          final news = filteredNewsList[index];
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      news.imageUrl,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      bottom: 18,
                      left: 16,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 10 * 8,
                        child: Text(
                          news.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 16,
                      child: Row(
                        children: [
                          const Icon(Icons.edit, color: Colors.white, size: 14),
                          Text(
                            news.date,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            news.time,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  news.description,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  news.content,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
