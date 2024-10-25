import 'package:doviz_clone_app/models/news_model/news.model.dart';
import 'package:doviz_clone_app/views/screens/news_view/news_detail_view.dart';
import 'package:flutter/material.dart';

class AllFuelNews extends StatefulWidget {
  const AllFuelNews({super.key});

  @override
  State<AllFuelNews> createState() => _AllFuelNewsState();
}

class _AllFuelNewsState extends State<AllFuelNews> {
  List<News> newsList = News.newsList;
  List<News> fuelNews =
      News.newsList.where((news) => news.category == "Emtia").toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 25),
            const Text(
              "Akaryakıt Fiyatları",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailPage(
                                newsList: fuelNews, // Pass all news
                                initialIndex: index, // Pass the selected index
                                selectedCategory:
                                    "Emtia", // Pass the category of the selected news
                              ),
                            ),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      10 *
                                      5.5,
                                  child: Text(
                                    fuelNews[index].title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${fuelNews[index].date} ${fuelNews[index].time}",
                                  style: const TextStyle(
                                    color: Color(0xFFcaccd1),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width / 10 * 2.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(9),
                                child: Image.network(
                                  fuelNews[index].imageUrl,
                                  width: 120,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              childCount: fuelNews.length,
            ),
          ),
        ],
      ),
    );
  }
}
