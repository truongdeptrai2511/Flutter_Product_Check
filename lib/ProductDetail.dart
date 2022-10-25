import 'package:badges/badges.dart';
import 'package:first_project_g1/NewsPage.dart';
import 'package:first_project_g1/ShoppingCard.dart';
import 'package:first_project_g1/model/ProductsModel.dart';
import 'package:first_project_g1/provider/ProductsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:first_project_g1/productpage.dart';
import 'package:first_project_g1/Cart.dart' as cart;

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  final ProductsModel product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  var backGroundColor = Color.fromRGBO(192, 192, 192, 110);
   int _counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(context),
            Detail(context),

          ],
        ),
      ),
      bottomNavigationBar: Order(context),
    );
  }

  AppBar(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Productpage()),
              );
            },
            icon: Icon(Icons.keyboard_backspace),
            iconSize: 27,
            color: Colors.black54,
          ),
          Text('Product Detail', style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black54),),
          Badge(
    badgeColor: Colors.blueGrey.shade900,
    position: BadgePosition.topEnd(top: 0, end: 3),
    animationDuration: Duration(milliseconds: 300),
    animationType: BadgeAnimationType.slide,
    badgeContent: Text(
    _counter.toString(),
    style: TextStyle(color: Colors.white),
    ),
            child: IconButton(

              onPressed: () {
                setState(() {
                  _counter++;
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoppingCard()),
                );
              },
              icon: Icon(Icons.shopping_cart),
              iconSize: 27,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Detail(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 200,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 2,
                    child: Image.network(widget.product.image.toString()),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: backGroundColor,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.title.toString(), style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),),
                  SizedBox(height: 10,),
                  Text(widget.product.description.toString(),maxLines: 3,
                    style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54),),
                  SizedBox(height: 15,),
                  Text("\$ ${widget.product.price.toString()}", style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }

  Order(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              onPressed: () {
                cart.add(widget.product, 1);
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width/1.2,
                child: Icon(Icons.shopping_cart,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }


}