import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/colorses.dart';
import '../CommonPage/notification.dart';

class Clubs extends StatefulWidget {
  @override
  _ClubsState createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          drawer: drawerDes(context),
          appBar: AppBar(
            elevation: 8,
            backgroundColor: appBarBackground,
            shadowColor: appBarShadow,
            title: Text(
              'Club',
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
                    Navigator.push(
                      context,
                      PageRouteBuilder(
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
                          }),
                    );
                  }),
            ],
          ),
          body: Container(
            color: backgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
// scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          height: 160,
                          width: double.maxFinite,
                          child: Card(
                            color: backgroundColor,
                            elevation: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: cardColor,
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(20.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: cardShadow,
                                        offset: const Offset(1, 1),
                                        blurRadius: 2)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(7),
                                child: Stack(children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Stack(
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 5),
                                            child: Text('data1', style: TextStyle(color: cardTextColor),))
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
