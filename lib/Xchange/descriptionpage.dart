// import 'package:demo_app/Pages/bodyofshoppage/content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model1.dart';

class Description extends StatelessWidget {
  final Product product;

  const Description({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CupertinoColors.activeOrange),
          height: 40,
          width: double.infinity,
          child: const Center(
              child: Text(
            'Add To Cart',
            style: TextStyle(
                color: CupertinoColors.systemBackground,
                fontSize: 20,
                fontFamily: 'Raleway'),
          )),
        ),
        // backgroundColor:Color(0xFF111111),
        appBar: AppBar(
          // elevation: 10,
          backgroundColor: CupertinoColors.separator,
          title: Text(
            product.title,
            style: const TextStyle(fontWeight: FontWeight.w500, letterSpacing: 1),
          ),
          // leading: Icon(Icons.arrow_back_ios,color: Colors.grey,),
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
        body: SingleChildScrollView(
          clipBehavior: Clip.antiAlias,
          child: Expanded(
            child: Container(
              color: CupertinoColors.separator,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Container(
                        color: Color(0xFF111111),
                        height: 350,
                        // color: CupertinoColors.darkBackgroundGray,
                        child: Hero(
                            tag: "${product.id}",
                            child: Image.asset(
                              product.image,
                            )),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(.5),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    // color: Colors.blueGrey,
                    height: 400,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Roboto'),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'It is a long established fact that a reader',
                                style: TextStyle(
                                    color: CupertinoColors.inactiveGray,
                                    fontSize: 12,
                                    fontFamily: 'Roboto'),
                              ),
                              const Text(
                                'It is a long established ',
                                style: TextStyle(
                                    color: CupertinoColors.inactiveGray,
                                    fontSize: 12,
                                    fontFamily: 'Roboto'),
                              ),
                              // SizedBox(height: 15,),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.pinkAccent.withOpacity(0.2),
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Icon(
                                      CupertinoIcons.heart,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "price - \$${product.price}",
                                style: const TextStyle(
                                    color: CupertinoColors.activeGreen,
                                    fontSize: 17,
                                    fontFamily: 'Roboto'),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Highlights",
                                      style: TextStyle(
                                        color: CupertinoColors.systemTeal,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      product.description,
                                      style: const TextStyle(
                                          color:
                                              CupertinoColors.inactiveGray,
                                          fontSize: 12,
                                          fontFamily: 'Roboto'),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      product.description,
                                      style: const TextStyle(
                                          color:
                                              CupertinoColors.inactiveGray,
                                          fontSize: 12,
                                          fontFamily: 'Roboto'),
                                      textAlign: TextAlign.justify,
                                    )
                                  ],
                                ),
                              )
                              // Text(product.description,style: TextStyle(color: CupertinoColors.inactiveGray,fontSize: 12) ,)
                            ],
                          ),
                        )
                      ],
                    ),
                  )

                  // Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.',style: TextStyle(color: Colors.grey),),
                  // SizedBox(height: 10,),
                  // Row(
                  //   children: [
                  //     Text(product.title,
                  //       style: TextStyle(color: Colors.white, letterSpacing: 2,),
                  //       textScaleFactor: 1.3,
                  //       textAlign: TextAlign.left,),
                  //     SizedBox(width: 80,),
                  //     Text(
                  //       "price - ${product.price}", style: TextStyle(color: Colors.lightGreen,letterSpacing: 1),
                  //       textScaleFactor: 1.3,),
                  //   ],
                  // ),
                  //
                  // SizedBox(height: 10,),
                  //
                  // SizedBox(height: 25,),
                  //  Text(
                  //     'Product Details', style: TextStyle(color: Colors.blue),textScaleFactor: 1.3,),
                  //
                  // SizedBox(height: 8,),
                  // Text(product.description, style: TextStyle(color: Colors.grey,fontSize:15 ),
                  //   textAlign: TextAlign.justify,),
                  // SizedBox(height: 40,),
                  // Text(product.description,style: TextStyle(color: Colors.grey,fontSize: 15),),
                  //  SizedBox(height: 20,),
                  // Center(
                  //   child: InkWell(
                  //     splashColor: Colors.green,
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.redAccent,
                  //         borderRadius: BorderRadius.circular(10)
                  //       ),
                  //       height: 40,
                  //       width: 300,
                  //
                  //       child: Center(child: Text('Buy Now' , style: TextStyle(color: CupertinoColors.white,fontSize: 15,fontWeight: FontWeight.bold,letterSpacing: 1),textScaleFactor: 1.2,)),
                  //     ),
                  //   ),
                  // ),
                  // Center(child: SizedBox(height:50 ,child: Center(child: Text('OR',style: TextStyle(color: CupertinoColors.white),)),)),
                  // Center(
                  //   child: InkWell(
                  //     splashColor: Colors.green,
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //           color: Colors.redAccent,
                  //           borderRadius: BorderRadius.circular(10)
                  //       ),
                  //       height: 40,
                  //       width: 300,
                  //
                  //       child: Center(child: Text('Add to cart' , style: TextStyle(color: CupertinoColors.white,fontSize: 15,fontWeight: FontWeight.bold,letterSpacing: 1),textScaleFactor: 1.2,)),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        // bottomSheet: Row(children: [TextButton(onPressed:null, child: Text('   Buy Now',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w500)),),
        // SizedBox(width: 120,),
        // Text('Add to cart',style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.w500),)],),
      ),
    );
  }
}
