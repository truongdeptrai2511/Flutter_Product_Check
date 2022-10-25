import 'dart:html';

import 'package:first_project_g1/CarouselSlider.dart';
import 'package:first_project_g1/genre_slider.dart';
import 'package:flutter/material.dart';

class view1 extends StatelessWidget {
  const view1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          carouselslider(),
          GenreSlider(),
          blockimage()
        ],
      ),
    );
  }
  blockimage(){
    return Image.asset('assets/images/eberhard-grossgasteiger-74bicDgsJ8A-unsplash.jpg');
  }
}
