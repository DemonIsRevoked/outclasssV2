import 'package:flutter/material.dart';

import '../Services/colorses.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      body: Center(
        child: Text(
          '  Notifications from Techers\n'
          'and others',
          style: TextStyle(
            color: colorMain3,
            fontWeight: FontWeight.bold,
            fontSize: 35,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
