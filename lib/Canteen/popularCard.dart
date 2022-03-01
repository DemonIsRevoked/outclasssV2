import "package:flutter/material.dart";

import 'constrCant.dart';

List<Product> productList = [
  Product(
      name: "Fries",
      image: "fries.png",
      rating: 4.2,
      price: 20,
      wishList: true),
  Product(
      name: "Noodles",
      image: "noodles.png",
      rating: 4.1,
      price: 50,
      wishList: false),
  Product(
      name: "Pizza",
      image: "pizza.png",
      rating: 5.2,
      price: 50,
      wishList: false),

  Product(
      name: "Sandwich",
      image: "sandwich.png",
      rating: 5.0,
      price: 5,
      wishList: true),
  Product(
      name: "Cola", image: "cola.png", rating: 4.2, price: 20, wishList: true),
];

class PopularCard extends StatelessWidget {
  const PopularCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
          itemCount: productList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 2)
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/${productList[index].image}",
                          height: 120,
                          width: 150,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: CustomTitle(
                            title: productList[index].name,
                            size: 18,
                            colors: Colors.white,
                            weight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white10,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(1, 1),
                                      blurRadius: 2)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: productList[index].wishList
                                  ? const Icon(Icons.favorite_border,
                                      size: 18, color: Colors.red)
                                  : const Icon(Icons.favorite,
                                      size: 18, color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: CustomTitle(
                                  title: '${productList[index].rating}',
                                  size: 15,
                                  colors: Colors.white70,
                                  weight: FontWeight.normal),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 12,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 12,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 12,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 12,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 12,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: CustomTitle(
                              title: "${productList[index].price}",
                              size: 20,
                              colors: Colors.white,
                              weight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
