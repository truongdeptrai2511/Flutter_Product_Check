import 'package:first_project_g1/model/ProductsModel.dart';

class CartItemModel {
  ProductsModel model;
  int quantity;

  CartItemModel({required this.model, required this.quantity});
}