import 'dart:convert';
import 'package:first_project_g1/model/ProductsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductsProvider extends ChangeNotifier {
  List<ProductsModel> list = [];
  List list1 = [];

  Future<void> getList() async {
    String apiURL = "https://fakestoreapi.com/products";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var newsListObject = jsonObject as List;
    list = newsListObject.map((e) {
      return ProductsModel.fromJson(e);
    }).toList();

    notifyListeners();
  }

  Future<void> getCategories() async {
    list1 = [];
    String apiURL = "https://fakestoreapi.com/products/categories";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var newsListObject = jsonObject as List;
    list1.add("All");
    list1.addAll(newsListObject);
    notifyListeners();
  }

  Future<void> getList1(String category) async {
    String apiURL = "https://fakestoreapi.com/products/category/$category";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var newsListObject = jsonObject as List;
    list = newsListObject.map((e) {
      return ProductsModel.fromJson(e);
    }).toList();

    notifyListeners();
  }

  List<ProductsModel> search(String value) {
    List<ProductsModel> list2 = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i].title!.toLowerCase().contains(value.toLowerCase())) {
        list2.add(list[i]);
      }
    }
    return list2;
  }

  List sort() {
    List list3 = [];
    for (int i = 0; i < list.length; i++) {
      list3.add(list[i]);
    }
    list3.sort((a, b) => a.rating['rate'].compareTo(b.rating['rate']));

    return list3;
  }
}
