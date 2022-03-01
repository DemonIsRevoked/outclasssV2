import 'package:flutter/material.dart';
import '../Services/colorses.dart';
import '../CommonPage/notification.dart';

class ClassStud extends StatefulWidget {
  const ClassStud({Key? key}) : super(key: key);

  @override
  _ClassStudState createState() => _ClassStudState();
}

class _ClassStudState extends State<ClassStud> {
  Widget buildPage(String text) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }
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
                          return NotificationPage();
                        }),
                  );
                }),
          ],
        ),
        body: Container(
          child: ListView.builder(
              itemCount: 2 ,
              scrollDirection: Axis.vertical,
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
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 20, top: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(150),
                                  child: Image.asset(
                                    "assets/images/elonmusk.jpg",
                                    width: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: const [
                                Padding(
                                  padding:
                                  EdgeInsets.only(left: 20, top: 20),
                                  child: Text(
                                    "Data Science",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.only(right: 30, top: 5),
                                  child: Text(
                                    "by Elon musk",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
