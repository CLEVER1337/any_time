import 'package:any_time/product_data.dart';
import 'package:any_time/widgets/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:any_time/utils/parser.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.productsData});

  final String title;
  final List<ProductData> productsData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductTypes currentType = ProductTypes.coffee;
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 241, 225, 202),
      //   elevation: 0,
      //   //title: Text(widget.title),
      // ),
      body: Align(
        alignment: Alignment.topLeft, 
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          //padding: EdgeInsets.only(left: 20, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color.fromARGB(255, 241, 225, 202),
                //width: 498,
                height: 113,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Выгодно и вкусно',
                        style: TextStyle(fontFamily: 'Podkova', fontWeight: FontWeight.w700, fontSize: 24, height: 0),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 
                          ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: const Image(image: AssetImage("assets/images/neco-arc-neco.gif"), width: 92, height: 117),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 5, top: 5)),
                          const SizedBox(
                            width: 80,
                            child: Text(
                              'Эклер в шоколаде',
                              style: TextStyle(fontFamily: 'Podkova', fontWeight: FontWeight.w400, fontSize: 16, height: 0, color: Color.fromARGB(255, 138, 72, 61)),
                              softWrap: true,
                            )
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: (){

                              },
                              child: Text(
                                'Кофе',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.coffee) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Text(
                                'Напитки',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.drinks) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Text(
                                'Эклеры',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.eclairs) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Text(
                                'Кукис',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.cookie) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Text(
                                'Сэндвичи',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.sandwiches) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Text(
                                'Круассаны',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.croissants) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Text(
                                'Каша',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.eclairs) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Text(
                                'Салаты',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.salads) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Text(
                                'Киш',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.quiche) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Text(
                                'Сладости',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.sweets) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 20)),
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Center(
                        child: Text(
                          'КОФЕ',
                          style: TextStyle(fontFamily: 'Pacifico', fontWeight: (currentType == ProductTypes.sweets) ? FontWeight.w400 : FontWeight.w400, fontSize: 30, color: Color.fromARGB(255, 138, 72, 61))
                        )
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      for(int i = 0; i < widget.productsData.length; i += 2)
                        Row(
                          mainAxisAlignment: (i + 1) < widget.productsData.length ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.spaceAround,
                          children: [
                            Product(data: widget.productsData[i]),
                            if((i + 1) < widget.productsData.length)
                              Padding(padding: EdgeInsets.only(right: 45)),
                            if((i + 1) < widget.productsData.length)
                              Product(data: widget.productsData[i + 1]),
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
