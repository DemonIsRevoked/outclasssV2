import 'package:flutter/material.dart';

import 'constrCant.dart';



List<Category> categoriesList=[
  Category(name:"FastFood",image:"1972.jpg"),
  Category(name:"Cold drinks",image:"20924.jpg"),
  Category(name:"hot drinks",image:"hot drinks.jpg"),
  Category(name:"Features",image:"1972.jpg"),
  Category(name:"Features",image:"1972.jpg"),
];


class Categories extends StatelessWidget {
const Categories();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
          height: 100,
          child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesList.length,
              itemBuilder: (_, index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(11.0,9.0,9.0,9.0),
                  child: Column(
                    children: [
                    ClipRRect(
                        borderRadius:BorderRadius.circular(150),
                      child: Image.asset(
                        "assets/images/${categoriesList[index].image}",
                        width:50,
                      ),
                    ),
                     const SizedBox(height:5,),
                      CustomTitle(
                          title: categoriesList[index].name,
                          size: 13,
                          colors: Colors.white,
                          weight:FontWeight.normal
                      ),
                    ],
                  ),
                );
              }
          )
      ),
    );
  }
}
