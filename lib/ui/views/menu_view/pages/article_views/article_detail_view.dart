import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class ArticleDetailView extends StatefulWidget {
  const ArticleDetailView({
    required this.articleImage,
    required this.articleTitle,
    required this.articleDate,
    required this.articleTime,
    required this.readingTime,
    required this.articleContent,
    super.key,
  });
  final String articleImage;
  final String articleTitle;
  final String articleDate;
  final String articleTime;
  final int readingTime;
  final String articleContent;

  @override
  State<ArticleDetailView> createState() => _ArticleDetailViewState();
}

class _ArticleDetailViewState extends State<ArticleDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldAndAppBarBackgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: iconColor,
          ),
        ),
        actions: const [
          Icon(
            Icons.share,
            color: iconColor,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Image.network(
                      widget.articleImage,
                      height: 200,
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 15,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 10 * 8.5,
                      child: Text(
                        widget.articleTitle,
                        style: const TextStyle(
                          color: defaultTextColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 2,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          color: iconColor,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          '${widget.readingTime} Dakika',
                          style: const TextStyle(
                            color: defaultTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  const Icon(
                    Icons.edit_outlined,
                    color: iconColor,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${widget.articleDate} ${widget.articleTime}',
                    style: const TextStyle(color: defaultTextColor),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                widget.articleContent,
                style: const TextStyle(
                  color: defaultTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
