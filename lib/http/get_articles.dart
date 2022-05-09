import 'dart:convert' as convert;
import "dart:math";
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {

  var topics = ['Apple','Tesla', 'Microsoft','Boring-Company'];
  final _random = Random();

  DateTime now = DateTime.now();
  DateTime date = DateTime(now.year, now.month, now.day);
  var url = Uri.https(
      'newsapi.org',
      '/v2/everything/',
      {
        'q': topics[_random.nextInt(topics.length)],
        'from': date.toString(),
        'sortBy': 'publishedAt',
        'apiKey': '8a658ba592014d589ff59930a49294d6'
      },
  );

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['totalResults'];
    print('Number of articles about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}