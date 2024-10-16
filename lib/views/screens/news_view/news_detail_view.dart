import 'package:flutter/material.dart';
import 'package:doviz_clone_app/models/news_model/news.model.dart';

class NewsDetailPage extends StatefulWidget {
  final List<News> newsList;
  final int initialIndex;
  final String selectedCategory;

  const NewsDetailPage({
    super.key,
    required this.newsList,
    required this.initialIndex,
    required this.selectedCategory,
  });

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
    int totalNews = filteredNewsList.length;
    int maxDots = 5; // Total number of dots

    List<Widget> indicators = [];
    int middleIndex = maxDots ~/ 2; // Middle of the dots (centered)

    if (totalNews > 0) {
      // Calculate the visible range of dots (centered around the currentIndex)
      int startIndex =
          (currentIndex - middleIndex).clamp(0, totalNews - maxDots);
      int endIndex = (startIndex + maxDots - 1).clamp(0, totalNews - 1);

      for (int i = startIndex; i <= endIndex; i++) {
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

        indicators.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: CircleAvatar(
            radius: size,
            backgroundColor: color,
          ),
        ));
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(news.imageUrl,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width),
                    Positioned(
                      bottom: 8,
                      left: 16,
                      child: Text(
                        news.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 16,
                      child: Row(
                        children: [
                          const Icon(Icons.edit, color: Colors.white, size: 14),
                          Text(news.date,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          Text(news.time,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(news.description,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Text(news.content,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
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
