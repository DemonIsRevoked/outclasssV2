import 'package:flutter/material.dart';

class Category {
  final String name;
  final String image;

  Category({required this.name,required this.image});
}

//Widgets ==============================
class CustomTitle extends StatelessWidget {
  final String title;
  final double size;
  final Color colors;
  final FontWeight weight;

  CustomTitle({
    required this.title,
    required this.size,
    required this.colors,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
          fontSize: size,
          color: colors,
          fontWeight: weight,
        ));
  }
}

class Product {
  final String name;
  final String image;
  final double rating;
  final double price;
  final bool wishList;

  Product({required this.name, required this.image, required this.rating, required this.price, required this.wishList});
}
