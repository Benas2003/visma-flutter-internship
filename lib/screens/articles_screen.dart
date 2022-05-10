import 'package:flutter/material.dart';
import 'package:flutter_news_application/screens/custom_article_screen.dart';

import 'package:news_api_flutter_package/news_api_flutter_package.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/error.dart';



class ArticlesScreen extends StatelessWidget {
  final NewsAPI _newsAPI = NewsAPI("8a658ba592014d589ff59930a49294d6");

  late final Future<List<Article>> articlesData = _newsAPI.getEverything(query: 'Tesla');

  ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: _buildListTabView(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Flutter News"),
    );
  }


  Widget _buildListTabView() {
    return FutureBuilder<List<Article>>(
        future: _newsAPI.getEverything(query: 'Boring'),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
              ? _buildArticleListView(snapshot.data!)
              : _buildError(snapshot.error as ApiError)
              : _buildProgress();
        });
  }

  Widget _buildArticleListView(List<Article> articles) {
    return 
      RefreshIndicator(
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            Article article = articles[index];
          return Card(
              child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomArticleScreen(customArticle: article)),
                  );
                },

                child: ListTile(
                  trailing: article.urlToImage == null
                      ? null
                      : Image.network(article.urlToImage!),
                  title: Text(article.title!, maxLines: 2),
                  subtitle: Text(article.description ?? "", maxLines: 3),
                 ),
               ),
            );
          },
          ),
          onRefresh: () {
            FutureBuilder<List<Article>>(
                future: _newsAPI.getEverything(query: 'Boring'),
                builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
                  return snapshot.connectionState == ConnectionState.done
                      ? snapshot.hasData
                      ? _buildArticleListView(snapshot.data!)
                      : _buildError(snapshot.error as ApiError)
                      : _buildProgress();
                });
              return _newsAPI.getEverything(query: 'Boring');
          }
      );
  }

  Widget _buildProgress() {
    return const Center(child: CircularProgressIndicator(color: Colors.orange,));
  }

  Widget _buildError(ApiError error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error.code ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 4),
            Text(error.message!, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}