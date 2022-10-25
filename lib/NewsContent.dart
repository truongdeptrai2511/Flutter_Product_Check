import 'package:first_project_g1/model/NewsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_project_g1/provider/NewsProvider.dart';
import 'package:provider/provider.dart';

class NewsContent extends StatelessWidget {
  const NewsContent({super.key, required this.data});

  final NewsModel data;

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    newsProvider.getList();
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
             Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.network(data.urlToImage??""),
                            Padding(padding: EdgeInsets.only(top: 10.0)),
                            Text(data.title??"Title",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),),
                            Padding(padding: EdgeInsets.only(top: 5.0)),
                            Text(data.content??"Content",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal, color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                ),

              ),
            )
        ],
      ),
    );
  }
}
