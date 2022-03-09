import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:outclassv3/Navigation/canteen.dart';
import 'package:outclassv3/Navigation/shoping.dart';
import 'package:outclassv3/Services/authentication.dart';

import '../Navigation/classPageStu.dart';
import '../Navigation/classPageTech.dart';
import '../Navigation/clubStud.dart';
import '../Navigation/home.dart';
import '../Services/colorses.dart';

final DataController controller = Get.find();

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);


  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _pageIndex = 0;
  List<Widget> listStud = <Widget>[
    HomePage(), //0
    const ClassStud(), //1
    Clubs(), //2
    const CanteenPage(), //3
    const ShopPage(), //4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listStud[_pageIndex],

      bottomNavigationBar: BottomNavyBar(
        animationDuration: const Duration(milliseconds: 400),
        backgroundColor: bottomBarBackground,
        itemCornerRadius: 8,
        selectedIndex: _pageIndex,
        showElevation: true,
        // use this to remove appBar's elevation
        onItemSelected: (value){
          setState(() {
            if (value == 1 && controller.userProfileData['role'] == 'TECH') {
              listStud[1] = const ClassTech();
            }
            else{
              listStud[1] = const ClassStud();
            }
            _pageIndex = value;

          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: const Icon(Icons.home, size: 28),
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 17),
              ),
              activeColor: activeButton,
              inactiveColor: backOfButton),
          BottomNavyBarItem(
              icon: const Icon(CupertinoIcons.book, size: 28),
              title: const Text('Class'),
              activeColor: activeButton,
              inactiveColor: backOfButton),
          BottomNavyBarItem(
              icon: const Icon(CupertinoIcons.suit_club, size: 28),
              title: const Text(
                'Club',
                style: TextStyle(fontSize: 17),
              ),
              activeColor: activeButton,
              inactiveColor: backOfButton),
          BottomNavyBarItem(
              icon: const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.shopping_cart, size: 18),
                ),
              ),
              title: const Text('Canteen'),
              activeColor: activeButton,
              inactiveColor: backOfButton),
          BottomNavyBarItem(
              icon: const Icon(Icons.storefront_rounded, size: 28),
              title: const Text('X-change'),
              activeColor: activeButton,
              inactiveColor: backOfButton)
        ],
      ),
    );
  }
}
