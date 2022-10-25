import 'dart:convert';

import 'package:first_project_g1/model/NewsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NewsProvider extends ChangeNotifier{
  List<NewsModel> list = [];
  void getList() async {
    String apiUrl = "https://newsapi.org/v2/everything?q=tesla&from=2022-10-18&sortBy=publishedAt&apiKey=e8d4e4e58afb40f0a350a23804aa2b0d";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body);
    var newListObject = jsonObject['articles'] as List;
    list = newListObject.map((e){
      return NewsModel.fromJson(e);
    }).toList();
  notifyListeners();
  }
}