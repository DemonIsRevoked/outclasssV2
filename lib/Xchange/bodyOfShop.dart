import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'descriptionpage.dart';
import 'itemcard.dart';
import 'model1.dart';

class bodyShop extends StatefulWidget {
  const bodyShop({Key? key}) : super(key: key);

  @override
  _bodyShopState createState() => _bodyShopState();
}

class _bodyShopState extends State<bodyShop> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          color:CupertinoColors.separator,
          child: GridView.builder(
            itemCount: Products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 20,
                childAspectRatio: 0.50),
            itemBuilder: (context, index) => ItemCard(
              product: Products[index],
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>Description(
                      product: Products[index],
                    ),
                  )),
            ),
          ),
        )
    );
  }
}
