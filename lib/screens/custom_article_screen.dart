import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

import 'package:news_api_flutter_package/model/article.dart';

class CustomArticleScreen extends StatelessWidget {
  const CustomArticleScreen({Key? key, required this.customArticle}) : super(key: key);

  final Article customArticle;

  @override
  Widget build(BuildContext context) {

    DateTime parsedDateTime = DateTime.parse(customArticle.publishedAt.toString());
    final String formatDate = DateFormat("yyyy-MM-dd").format(parsedDateTime);

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    customArticle.title.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  customArticle.author.toString() + " " + formatDate,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );


    Widget textSection = Padding(
      padding: EdgeInsets.all(30),
      child: Text(
        customArticle.content.toString(),
        softWrap: true,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Article',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Article'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView(
          children: [
            Image.network(
              customArticle.urlToImage.toString(),
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection,
            Container(
              margin: const EdgeInsets.only(right: 30, left: 30),
              child:
              ElevatedButton(
                onPressed: () {
                  _launchURL(customArticle.url.toString());
                },
                child: const Text('Read more >'),
              ),
            ),
          ],
        ),
      ),
    );
  }

_launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}