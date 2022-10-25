import 'package:first_project_g1/model/CartItemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:first_project_g1/model/ProductsModel.dart';
import 'package:flutter/material.dart';
import 'package:first_project_g1/Cart.dart' as cart;

class ShoppingCard extends StatefulWidget {
  const ShoppingCard({Key? key}) : super(key: key);

  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}
var backGroundColor = Color.fromRGBO(192, 192, 192, 110);
class _ShoppingCardState extends State<ShoppingCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 1.3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...cart.list.map((e) {
                      return cartItem(e);
                    })
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total: ${cart.total().toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Check out",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  cartItem(CartItemModel item) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Image.network(item.model.image!,width: 80,height: 110,),
          SizedBox(
            width: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.8,
            child: Padding(
              padding: const EdgeInsets.only(top:8.0,left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.model.title!,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                  ),
                  Text(
                    item.model.category!,
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${item.model.price}",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (item.quantity > 1)
                                    setState(() {
                                      for (int i = 0; i < cart.list.length; i++) {
                                        if (item.model.id ==
                                            cart.list[i].model.id)
                                          cart.list[i].quantity--;
                                      }
                                    });
                                },
                                icon: Icon(Icons.remove_circle_outline)),
                            SizedBox(
                              width: 20,
                              child: Text(item.quantity.toString()),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    for (int i = 0; i < cart.list.length; i++) {
                                      if (item.model.id == cart.list[i].model.id)
                                        cart.list[i].quantity++;
                                    }
                                  });
                                },
                                icon: Icon(Icons.add_circle)),

                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
          ,
          Padding(
            padding: const EdgeInsets.only(top:10.0,left: 15),
            child: Column(children: [
              IconButton(onPressed: (){
                setState(() {
                  cart.remove(item.model.id as int);
                });
              }, icon: Icon(Icons.delete))
            ],),
          )
        ],
      ),
    );
  }
}
