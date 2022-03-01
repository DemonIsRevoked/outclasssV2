import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model1.dart';


class ItemCard extends StatelessWidget {
  final Product product;
  final  dynamic press;
  const ItemCard({
 Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Expanded(
        child: Container(
          height: 400,
          decoration: BoxDecoration(color:  const Color(0xFF111111),
          borderRadius: BorderRadius.circular(10) ),
          child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                    child: Container(
                      height: 200,
                     width: 150,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF111111),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Hero(
                        tag: "${product.id}",
                        child: Image.asset(product.image,fit: BoxFit.fitHeight,),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30,0,0,0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                   Text(
                  product.title,
                     style: const TextStyle(color: Colors.white,fontSize: 15),),
                   const SizedBox(height: 5,),
                   const Text('It is a long established fact that a reader',style: TextStyle(color: CupertinoColors.inactiveGray,fontSize: 10),),
                   const SizedBox(height: 15,),
                   Row(
                     children: [
                       Text(
                         "\$${product.price}",
                           style: const TextStyle(color: CupertinoColors.extraLightBackgroundGray,fontSize: 15,fontWeight: FontWeight.w700,), ),
                       const SizedBox(width: 80,),
                       const Icon(CupertinoIcons.heart,size: 20,color: Colors.red,)
                     ],
                   ),
                   ],
                  ),
                )

                // Icon(CupertinoIcons.heart_fill,color: Colors.white,)
              ],
            ),

        ),
      ),
    );
  }
}