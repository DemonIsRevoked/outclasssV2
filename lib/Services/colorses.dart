import 'package:flutter/material.dart';

import '../CommonPage/profile.dart';
import 'authentication.dart';

Widget drawerDes(BuildContext context){
  return Theme(
    data: Theme.of(context)
        .copyWith(canvasColor: Colors.black.withOpacity(0.6)),
    child: Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: mainDrawer.withOpacity(0.5),
              borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(90)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: drawerText,
                  radius: 43,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/d/9/a/d9a1058910_50163142_elon-musk1.jpg'),
                    radius: 42,
                  ),
                ),
                Text(
                  auth.currentUser!.displayName.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: drawerText),
                ),
                Text(
                  auth.currentUser!.email.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: drawerText),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.home,
              color: drawerText,
            ),
            title: Text("Home",
                style: TextStyle(fontSize: 15, color: drawerText)),
            trailing: Icon(
              Icons.arrow_back,
              color: drawerText,
              size: 25,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => General()));
            },
            child: ListTile(
              leading: Icon(
                Icons.supervised_user_circle,
                color: drawerText,
              ),
              title: Text("Account ",
                  style: TextStyle(fontSize: 15, color: drawerText)),
              trailing: Icon(
                Icons.supervised_user_circle,
                color: drawerText,
                size: 25,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.save_outlined,
              color: drawerText,
            ),
            title: Text("Saved",
                style: TextStyle(fontSize: 15, color: drawerText)),
            trailing: Icon(
              Icons.save,
              color: drawerText,
              size: 25,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: drawerText,
            ),
            title: Text("Setting",
                style: TextStyle(fontSize: 15, color: drawerText)),
            trailing: Icon(
              Icons.settings_applications,
              color: drawerText,
              size: 25,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: drawerText,
            ),
            title: Text("About Us",
                style: TextStyle(fontSize: 15, color: drawerText)),
            trailing: Icon(
              Icons.people_alt_outlined,
              color: drawerText,
              size: 25,
            ),
          ),
          Divider(
            thickness: 2,
            color: mainDrawer.withOpacity(0.5),
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            title: Text("Help Center ",
                style: TextStyle(fontSize: 15, color: drawerText)),
          ),
          ListTile(
            title: Text("Setting & Privacy ",
                style: TextStyle(fontSize: 15, color: drawerText)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: OutlinedButton.icon(
              style: TextButton.styleFrom(
                side: BorderSide(color: mainDrawer.withOpacity(0.7)),
              ),
              icon: Icon(
                Icons.logout,
                color: mainDrawer.withOpacity(0.7),
              ),
              label: Text(
                'Logout',
                style: TextStyle(color: drawerText, fontSize: 15),
              ),
              onPressed: () {
                UserInstanceManagement().handleSignOut(context);
              },
            ),
          ),
        ],
      ),
    ),
  );
}
//Color scheme ============================

Color backgroundColor = const Color(0xF31A1A1A), //backgroundColor

//default Pages

    appBarBackground = const Color(0xFF131313), //topGradient1
    appBarShadow = const Color(0xFFB14AFF),  //topGradient2
    colorMain3 = const Color(0xFFFFFFFF), //TextColor
    colorMain4 = const Color(0xFF3682F6), //NavBarColor
    colorMain5 = const Color(0xAF0E1F3D), //buttonColor
//bottomNavigationBar colors ==================
    bottomBarBackground = const Color(0xEE000000),
    activeButton = const Color(0xFFB14AFF),
    backOfButton = const Color(0xFF9C9C9C),
    appBarItems = Colors.white,
//home colors
    backgroundCardColor = const Color(0xFF3D1285),
    cardTextColor = const Color(0xFF8D3CF1),
    navBarButtton = Colors.white,

//login page colors
    color1 = const Color(0xFF044B9D),
    color2 = const Color(0xFFFFFFFF),
    color3 = Colors.white60,
    buttonLogin = Colors.black12,
    buttonText = const Color(0xFF3D1285),

// Club Page
    cardColor = Colors.white10,//Color(0xFA151414),
    cardText  = const Color(0xFFB14AFF),
    cardShadow = Colors.black,
//profile drawer Color
    mainDrawer = const Color(0xFF6714E2),
    drawerText = Colors.white


;

