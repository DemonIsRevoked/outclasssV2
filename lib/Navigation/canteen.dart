import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outclassv3/Canteen/popularCard.dart';
import 'package:outclassv3/Services/colorses.dart';
import '../Canteen/featuredItemCard.dart';
import '../Canteen/categories.dart';

class CanteenPage extends StatefulWidget {
  const CanteenPage({Key? key}) : super(key: key);

  @override
  _CanteenPageState createState() => _CanteenPageState();
}

class _CanteenPageState extends State<CanteenPage> {
  // final FeaturedCard featuredCard=FeaturedCard();
  //final Categories categories=Categories();
  //final PopularCard popularCard=PopularCard();
  @override
  Widget build(BuildContext context) {
   // final Size size = MediaQuery.of(context).size;
  //  final double categoryHeight = size.height * 0.30;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
          drawer: drawerDes(context),
          appBar: AppBar(
            elevation: 8,
            backgroundColor: appBarBackground,
            shadowColor: appBarShadow,
            title: Text(
              'Canteen',
              style: TextStyle(color: appBarItems),
            ),
            centerTitle: true,
            actions: [
          IconButton(
              icon: const Icon(
                CupertinoIcons.shopping_cart,
                color: CupertinoColors.systemTeal,
              ),
              onPressed: () {}),
          IconButton(
                  icon: const Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                  ),
                  onPressed: () {}),

            ],
          ),
      body: Container(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "what do you like to eat?",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 20),
                ),
              ),
            ],
          ),
          const Categories(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Features",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 20),
                ),
              ),
            ],
          ),
          const FeaturedCard(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Popular",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 20),
                ),
              ),
            ],
          ),
          const PopularCard(),
          //popularCard,
        ],
      )),
    ));
  }
}
