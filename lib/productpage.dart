import 'package:first_project_g1/NewsPage.dart';
import 'package:first_project_g1/ProductDetail.dart';
import 'package:first_project_g1/ShoppingCard.dart';
import 'package:first_project_g1/model/ProductsModel.dart';
import 'package:first_project_g1/provider/ProductsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import 'package:first_project_g1/Cart.dart' as cart;

class Productpage extends StatefulWidget {
  const Productpage({Key? key}) : super(key: key);
  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  bool isview = true;
  int _counter = 0;
  var isloading = true;
  var category = "All";
  var backGroundColor = Color.fromRGBO(192, 192, 192, 110);
  var productColor = Color(0xE3DBD9);
  List listproduct = [];
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductsProvider>(context);
    if (isloading) {
      (() async {
        await productProvider.getCategories();
        await productProvider.getList();
        setState(() {
          listproduct = productProvider.list;
          isloading = false;
        });
      })();
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: backGroundColor,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shopping(context),
                SizedBox(
                  height: 10,
                ),
                Titles(context),
                SizedBox(
                  height: 20,
                ),
                Search(context, productProvider),
                SizedBox(
                  height: 30,
                ),
                Categories(context, productProvider),
                SizedBox(
                  height: 10,
                ),
                isview?Items(context, productProvider) :buildlist(context, productProvider),
              ],
            ),
          ),
        ),
      ),
    );
  }
  buildlist(BuildContext context,productsProvider) {
    List list = listproduct;

    return isloading
        ? Center(
      child: CircularProgressIndicator(),
    )
        : Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,

        itemCount: list.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(product: list[index],)));
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Image.network(
                            list[index].image,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(list[index].title, maxLines: 1,
                                style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black54)),
                            Text((list[index].price).toString() + ' \$',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16,color: Colors.green)),
                          ],
                        ),
                      ),
                      IconButton(onPressed: (){
                        setState(() {
                          cart.add(list[index], 1);
                        });
                      }, icon:Icon(Icons.shopping_cart),)
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
  Shopping(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'assets/images/santiago-yanez-KogReqQ3p1E-unsplash.jpg',
              width: 35,
              height: 35,
              fit: BoxFit.cover,
            ),
          ),
          Text('HEHEMALL', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, ),),
          Badge(
            badgeColor: Colors.blueGrey.shade900,
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              cart.list.length.toString(),
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
            ),
          ),
          isview?
              IconButton(onPressed: (){
                setState(() {
                  isview = false;
                });
              }, icon: Icon(Icons.grid_view_outlined))
              :IconButton(onPressed: (){
                setState(() {
                  isview =true;
                });
          }, icon: Icon(Icons.list_alt_outlined))

        ],
      ),
    );
  }
  Titles(BuildContext context) {
    SizedBox(height: 10,);
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Choose",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Your",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text("Favorite",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(
                width: 5,
              ),
              Text(
                "Product",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      ),
    );
  }

  Search(BuildContext context, productProvider) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: TextField(
        onChanged: (value) {
          setState(() {
            listproduct = productProvider.search(value);
          });
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Search products",
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Categories(BuildContext context, productProvider) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.black54),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...productProvider.list1.map((e) {
                    return GestureDetector(
                      onTap: () {
                        setState(() async {
                          category = e;
                          if (e == "All") {
                            await (productProvider.getList());
                            listproduct = productProvider.list;
                          } else {
                            await (productProvider.getList1(e));
                            listproduct = productProvider.list;
                          }
                        });
                      },
                      child: Row(
                        children: [
                          category == e
                              ? Text(
                            e,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                              : Text(
                            e,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    );
                  }).toList()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Items(BuildContext context, productProvider) {
    List list = listproduct;

    return isloading
        ? Center(
      child: CircularProgressIndicator(),
    )
        : Expanded(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2.3,
          mainAxisExtent: 250, // the size of item
          crossAxisSpacing: 20, // margin of 10px top and bottom
          mainAxisSpacing: 15, // margin of 10px left and right
          // the spacing is not applicable on the GridView margins.
        ),
        itemCount: list.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(product: list[index],)));
              });
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Center(
                      child: Image.network(
                        list[index].image,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(list[index].title, maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black54)),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text((list[index].price).toString() + ' \$',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16,color: Colors.green)),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          IconButton(onPressed: (){
                            setState(() {
                              cart.add(list[index], 1);
                            });
                          }, icon:Icon(Icons.shopping_cart),)
                        ],
                        )
                        ],
                      ),

                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
