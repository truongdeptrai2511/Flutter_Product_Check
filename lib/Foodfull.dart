import 'package:flutter/material.dart';

class FoodFull extends StatelessWidget {
  const FoodFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle(context),
                SizedBox(height: 20,),
                buildBar(context),
                SizedBox(height: 15,),
                buildGrid(context),
                SizedBox(height: 20,),
                buildPlace(context),
                buildCategory(context)
              ],
          ),
        ),
      ),
    );
  }

  buildTitle(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),color: Colors.grey ),
          IconButton(onPressed: (){}, icon: Icon(Icons.search), padding: EdgeInsets.fromLTRB(300, 0, 0, 0),color: Colors.grey)
        ],
    );
  }

  buildBar(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
    Text.rich(
    TextSpan(
    text: "Today's Special",
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),
      children: [
        TextSpan(
          text: "\n\nFind out what's cooking today!",
          style: TextStyle(color: Colors.grey,
            fontSize: 10,
          ),
        ),
      ],
    ),
    ),
      ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ), child: Container(
        padding: EdgeInsets.all(7),
        child: Text.rich(
          TextSpan(
            children: [
              WidgetSpan(child: Icon(Icons.shopping_cart,size: 17,)),
              TextSpan(
                text: "CART", style: TextStyle(
              )
              )
            ]
          )
        ),
      ))
    ],);
  }
  buildGrid(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Container(
              height: 290,
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromRGBO(84, 193, 243, 1),
                boxShadow: [BoxShadow(color: Color.fromRGBO(84, 193, 243, 100),offset: Offset(1,7))]
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/309580761_611917900720121_2587616516374251832_n.png"),
                    SizedBox(height: 10,),
                    Text("Yoshimasa Sushi", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        for(var i=0; i<5 ;i++)
                          Icon(Icons.star, size: 17,color: Colors.white,),
                        Text("250 Ratings", style: TextStyle(fontSize: 12, color: (Colors.white)),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("Sushi cá luộc tái thất truyền 100 năm nay được đầu bếp michelin tái tạo lại trên mâm gỗ cực nồng mùi gỗ.", style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal,color: Colors.white),)
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 290,
            width: (MediaQuery.of(context).size.width*2)/5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: 265/2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromRGBO(106,222,129,1),
                      boxShadow: [BoxShadow(color: Color.fromRGBO(106, 222, 129, 100),offset: Offset(1,7))]
                  ),
                  child: 
                  item("assets/images/305607738_1415366495540878_5111293238821544031_n.png","Yoshimasa Sushi",5)
                  ,
                ),
                Container(
                  width: double.infinity,
                  height: 265/2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color.fromRGBO(80,80,82,1),
                      boxShadow: [BoxShadow(color: Color.fromRGBO(80,80,82,100),offset: Offset(1,7))]
                  ),
                  child: item("assets/images/304946381_405302571677122_1744908928026983867_n.png","Yoshimasa Sushi",5),
                ),
              ],
            ),
          ),
        ],
      ),
      );
  }
  buildPlace(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Places",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        Container(
          width: 270,
          height: 20,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black12,width: 1))
          ),
        )
      ],
    );

  }
  buildCategory(BuildContext context){
    return Expanded(child:
    ListView(
      scrollDirection: Axis.vertical,
      children: [
    Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
      children: [
        Category("assets/images/296104873_1119243372131775_2620954325654627446_n.png","Sushi Bong Dem",5,"xin chao shushi b"),
        Category("assets/images/306501930_609201684157556_3564505446527546277_n.png","Sushi Anh Sang",5,"xin chao shushi b"),
        Category("assets/images/296104873_1119243372131775_2620954325654627446_n.png","Sushi Nau Chin",5,"xin chao shushi b"),

      ],
      ),
    )
      ],
    )
    );
  }

  item(String image,String name, int ratings) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image),
          Text(name,style: TextStyle(color: Colors.white),),
          Text.rich(
            TextSpan(
              children: [
                for(int i=0; i<ratings; i++)
                  WidgetSpan(child: Icon(Icons.star,color: Colors.white,size: 17,)),
              ],
            )
          ),
        ],
      ),
    );
    
  }

  Category(String image,String name,int rating,String content) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image),
          Container(
            width: 150,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: TextStyle(fontSize: 15),),
                Text.rich(
                    TextSpan(
                      children: [
                        for(int i=0; i<rating; i++)
                          WidgetSpan(child: Icon(Icons.star,color: Colors.orange,size: 17,)),
                      ],
                    )
                ),
                Text(content),
              ],
            ),
          ),
          Container(
            width: 100,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.greenAccent,
            ),
            child: Center(
              child: Text("Order Now"),
            ),
          ),
        ],
      ),
    );
  }


}
