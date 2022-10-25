import 'package:first_project_g1/Foodfull.dart';
import 'package:first_project_g1/LoginPage.dart';
import 'package:first_project_g1/NewsPage.dart';
import 'package:first_project_g1/productpage.dart';
import 'package:first_project_g1/SendDataTest.dart';
import 'package:first_project_g1/food_page.dart';
import 'package:first_project_g1/homepage.dart';
import 'package:first_project_g1/productpage.dart';
import 'package:first_project_g1/provider/NewsProvider.dart';
import 'package:first_project_g1/provider/ProductsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'destination.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ProductsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Productpage()
      ),
    )
  );
}