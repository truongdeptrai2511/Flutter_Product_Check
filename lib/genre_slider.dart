import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenreSlider extends StatefulWidget {
  const GenreSlider({Key? key}) : super(key: key);

  @override
  State<GenreSlider> createState() => _GenreSliderState();
}

class _GenreSliderState extends State<GenreSlider> {
  List<String> _list = [
    'game',
    'Music',
    'Entertaiment',
    'Rollbox',
    'University',
    'Travel'
  ];
  String genreSelected = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ..._list.map((e) {
              return InkWell(
                onTap: (){
                  setState(() {
                    genreSelected = e;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                    (
                        genreSelected == e?Colors.white:Colors.grey
                    ),
                  ),
                  child: Text(e,
                    style: TextStyle(fontSize: 13,color: (genreSelected == e?Colors.black:Colors.white)),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}