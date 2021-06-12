import 'dart:convert';
import 'package:app/practiceTwo/constants/urls.dart';
import 'package:app/practiceTwo/model/news_model.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var url = Uri.parse(Urls.mainUrl);
    var newsModel;

    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
