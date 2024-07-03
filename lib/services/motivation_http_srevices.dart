import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lesson69/models/motivation.dart';

class MotivationHttpServices {
  static const String apiKey = 'RlSTgjVlwtL6rtKBfjJOfA==nkgDG6wzToRdUkas';
  static const String baseUrl =
      'https://api.api-ninjas.com/v1/quotes?category=';

  Future<List<MotivationModel>> fetchQuoteData(String category) async {
    final String apiUrl = '$baseUrl$category';
    final response =
        await http.get(Uri.parse(apiUrl), headers: {'X-Api-Key': apiKey});

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      List<MotivationModel> loadedQuotes = jsonData
          .map((item) => MotivationModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return loadedQuotes;
    } else {
      print('Error: ${response.statusCode} ${response.body}');
      return [];
    }
  }
}

// void main(List<String> args) async {
//   final quotes = await MotivationHttpServices.fetchQuoteData("happiness");

//   for (var quote in quotes) {
//     print('Quote: ${quote.quote}');
//     print('Author: ${quote.author}');
//   }
// }
