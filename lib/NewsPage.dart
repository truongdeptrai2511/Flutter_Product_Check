import 'package:first_project_g1/NewsContent.dart';
import 'package:first_project_g1/homepage.dart';
import 'package:first_project_g1/provider/NewsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    newsProvider.getList();
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ...newsProvider.list.map((e){
            return Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsContent(data:e)));
                    },style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.network(e.urlToImage??""),
                              Padding(padding: EdgeInsets.only(top: 10.0)),
                              Text(e.title??"Title",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),),
                              Padding(padding: EdgeInsets.only(top: 5.0)),
                              Text(e.content??"Content",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal, color: Colors.black)),
                            ],
                          ),
                        ),
                  ),
                  ),
                ),

              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
