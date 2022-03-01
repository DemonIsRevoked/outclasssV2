import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:outclassv3/Services/authentication.dart';
import '../Services/colorses.dart';
import '../CommonPage/notification.dart';

class HomePage extends StatelessWidget {

 HomePage({Key? key}) : super(key: key);
  final DataController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 8,
            backgroundColor: appBarBackground,
            shadowColor: appBarShadow,
            title: Text(
             'Home',
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
          drawer: drawerDes(context),
          body: Center(
        child:
        Obx(() =>Text('Hello, ${controller.userProfileData['userName']} ', style: TextStyle(color: cardTextColor, fontSize: 20),),

        ),
      ),));
  }
}
