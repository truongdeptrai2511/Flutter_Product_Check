library cart;

import 'package:first_project_g1/model/ProductsModel.dart';

import 'model/CartItemModel.dart';

List<CartItemModel> list =[];

void add(ProductsModel product,int sl){
  CartItemModel cart = new CartItemModel(model: product,quantity: sl);
  for(int i=0;i<list.length;i++){
    if(product.id==list[i].model.id){
      list[i].quantity+=sl;
      return;
    }
  }
  list.add(cart);
}

void remove(int id){
  List<CartItemModel> list1 =[];

  for(int i=0;i<list.length;i++){
    if(list[i].model.id==id){

    }
    else{
      list1.add(CartItemModel(model:list[i].model,quantity: list[i].quantity));
    }
  }
  list=list1;
}

double total(){
  double tong=0;
  for(int i=0;i<list.length;i++){
    tong+=list[i].quantity*list[i].model.price!;
  }
  return tong;
}