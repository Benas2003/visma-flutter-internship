import 'package:flutter/material.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    // return MaterialApp(
    //   title: "Articles",
    //   theme: ThemeData(
    //     primaryColor: Colors.white,
    //   ),
    // )

    return Scaffold(
      appBar: AppBar(
        title: Row(
            children: <Widget>[
            const Text('Articles'),
        ],

        ),
      ),
      body:
      ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Container(
            height: 200,
            //color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children:[
                Image(
                    image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          'Wall St slides as higher treasury yields hit growth stocks; Nasdaq down 3.4%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Rivian\'s stock price fell more than 17% Monday, a drop prompted by a CNBC report that Ford was selling 8 million shares of the EV automaker.',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}