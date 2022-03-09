import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CommonPage/notification.dart';
import '../Services/colorses.dart';

class ClassTech extends StatefulWidget {
  const ClassTech({Key? key}) : super(key: key);

  @override
  _ClassTechState createState() => _ClassTechState();
}

class _ClassTechState extends State<ClassTech> {

  Widget buildPage(String text) {
    return Container(
      color: backgroundColor,
      child:  Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 28),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerDes(context),
      appBar: AppBar(
        elevation: 8,
        backgroundColor: appBarBackground,
        shadowColor: appBarShadow,
        title: Text(
          'Class',
          style: TextStyle(color: appBarItems),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: appBarItems,
              ),
              onPressed: () {
                Get.to(PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 350),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secAnimation,
                        Widget child) {
                      animation = CurvedAnimation(
                          parent: animation, curve: Curves.easeInOutCirc);
                      return ScaleTransition(
                        alignment: Alignment.topRight,
                        scale: animation,
                        child: child,
                      );
                    },
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secAnimation) {
                      return const NotificationPage();
                    }));
              }),
        ],
      ),
      body: buildPage('Attendance List'),



    );

  }
}
class ClassCard extends StatelessWidget {
  const ClassCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 21.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.access_time,
                  size: 40.0,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    "Joined Date",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "21 August 2020",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

