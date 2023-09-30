import 'dart:core';

class Product {
  int id;
  String name;
  String image;
  String price;
  List<String> color;
  String amount;
  String desc;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.color,
      required this.desc,
      required this.image,
      required this.amount});
}
