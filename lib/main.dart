import 'package:flutter/material.dart';
import 'package:flutter_news_application/screens/articles_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter news app',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ArticlesScreen(),
    );
  }
}
