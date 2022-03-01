import 'package:flutter/material.dart';
import 'package:outclassv3/Pages/register.dart';

import '../Services/colorses.dart';
import 'login.dart';



class WelcomePages extends StatelessWidget {
  const WelcomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                  'assets/images/welcome.jpg',
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    "OUTCLASS",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: colorMain4),
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(
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
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation) {
                                return const Login();
                              }),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: colorMain3,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(70)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(
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
                                  alignment: Alignment.center,
                                  scale: animation,
                                  child: child,
                                );
                              },
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secAnimation) {
                                return const RegisterForm();
                              }),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                              color: colorMain3,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
