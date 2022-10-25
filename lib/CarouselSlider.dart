import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class carouselslider  extends StatelessWidget {
  carouselslider ({Key? key}) : super(key: key);
  List<String> _list = [
    'assets/images/eberhard-grossgasteiger-74bicDgsJ8A-unsplash.jpg',
    'assets/images/eberhard-grossgasteiger-YbSn3E89Lqk-unsplash.jpg',
    'assets/images/santiago-yanez-KogReqQ3p1E-unsplash.jpg',
    'assets/images/eberhard-grossgasteiger-74bicDgsJ8A-unsplash.jpg',
    'assets/images/eberhard-grossgasteiger-74bicDgsJ8A-unsplash.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/3,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ..._list.map((e){
              return Container(
                margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(e),
                    fit: BoxFit.cover
                  )
                ),
              );
            })
          ],
        ),
      ),
    );
  }

}
