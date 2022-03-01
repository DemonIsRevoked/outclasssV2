import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Xchange/bodyOfShop.dart';

class MyTheme {
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.red,
      canvasColor: CupertinoColors.black,
      fontFamily: 'Raleway',
      scaffoldBackgroundColor: CupertinoColors.black,
      iconTheme: const IconThemeData(color: CupertinoColors.activeBlue),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        centerTitle: true,
        color: CupertinoColors.black,
      ));
}

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.darkTheme(context),
      home: SafeArea(top: true,
        child: Scaffold(
            appBar: AppBar(
              // elevation: 10,
              backgroundColor: CupertinoColors.separator,
              title: const Text(
                'X-change',
                style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 3),
              ),

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
                    onPressed: () {})
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    color: CupertinoColors.separator,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Products',
                            style: TextStyle(
                              color: CupertinoColors.extraLightBackgroundGray,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            'To be sell',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          )
                        ],
                      ),
                    )),
                const Bodyy(),
                // Divider(color: Colors.grey,thickness: 0,height: 0,),
                // Expanded(child: Text('hello',style: TextStyle(color: Colors.white)),)
              ],
            )),
      ),
    );
  }

}

class Bodyy extends StatefulWidget {
  const Bodyy({Key? key}) : super(key: key);

  @override
  _BodyyState createState() => _BodyyState();
}

class _BodyyState extends State<Bodyy> {
  int selectedIndex = 0;
  List<String> Filter = [
    'Books',
    'Notes',
    'Acessories',
    'Ed-Items',
    "MCQ's",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.separator,
      height: 25,
      child: ListView.builder(
        itemCount: Filter.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => buildfilter(index),
      ),
    );
  }

  Widget buildfilter(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Filter[index],
              style: TextStyle(
                color: selectedIndex == index
                    ? Colors.white
                    : Colors.grey.withOpacity(.5),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 1,
              width: 40,
              color: selectedIndex == index ? Colors.grey : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
