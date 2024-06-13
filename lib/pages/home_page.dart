import 'dart:math';

import 'package:any_time/product_data.dart';
import 'package:any_time/widgets/product.dart';
import 'package:auto_height_grid_view/auto_height_grid_view.dart';
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

  ScrollController _scrollController = ScrollController();

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
          controller: _scrollController,
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
                                // double pixels = 335;
                                // _scrollController.animateTo(
                                //   pixels, 
                                //   duration: Duration(milliseconds: pixels.toInt()), 
                                //   curve: Curves.ease
                                // );
                              },
                              child: Text(
                                'Кофе',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.coffee) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){
                                double pixels = 335;
                                for(var type in ProductType.types.takeWhile((value) => value != ProductTypes.drinks.name)){
                                  pixels += ((widget.productsData.where((element) => element.type.typeStr == type).length / 2).ceil() * 270) + 20;
                                }
                                _scrollController.animateTo(
                                  pixels, 
                                  duration: Duration(milliseconds: (pixels * 0.1).toInt()), 
                                  curve: Curves.ease
                                );
                              },
                              child: Text(
                                'Напитки',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.drinks) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){
                                double pixels = 335;
                                for(var type in ProductType.types.takeWhile((value) => value != ProductTypes.eclairs.name)){
                                  pixels += ((widget.productsData.where((element) => element.type.typeStr == type).length / 2).ceil() * 257) + (18 * 2);
                                }
                                _scrollController.animateTo(
                                  pixels, 
                                  duration: Duration(milliseconds: (pixels * 0.1).toInt()), 
                                  curve: Curves.ease
                                );
                              },
                              child: Text(
                                'Эклеры',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.eclairs) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){
                                double pixels = 335;
                                for(var type in ProductType.types.takeWhile((value) => value != ProductTypes.cookie.name)){
                                  pixels += ((widget.productsData.where((element) => element.type.typeStr == type).length / 2).ceil() * 257) + (18 * 3);
                                }
                                _scrollController.animateTo(
                                  pixels, 
                                  duration: Duration(milliseconds: (pixels * 0.1).toInt()), 
                                  curve: Curves.ease
                                );
                              },
                              child: Text(
                                'Кукис',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.cookie) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){
                                double pixels = 335;
                                for(var type in ProductType.types.takeWhile((value) => value != ProductTypes.sandwiches.name)){
                                  pixels += ((widget.productsData.where((element) => element.type.typeStr == type).length / 2).ceil() * 257) + (18 * 4);
                                }
                                _scrollController.animateTo(
                                  pixels, 
                                  duration: Duration(milliseconds: (pixels * 0.1).toInt()), 
                                  curve: Curves.ease
                                );
                              },
                              child: Text(
                                'Сэндвичи',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.sandwiches) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){
                                double pixels = 335;
                                for(var type in ProductType.types.takeWhile((value) => value != ProductTypes.croissants.name)){
                                  pixels += ((widget.productsData.where((element) => element.type.typeStr == type).length / 2).ceil() * 257) + (18 * 5);
                                }
                                _scrollController.animateTo(
                                  pixels, 
                                  duration: Duration(milliseconds: (pixels * 0.1).toInt()), 
                                  curve: Curves.ease
                                );
                              },
                              child: Text(
                                'Круассаны',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.croissants) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){
                                double pixels = 335;
                                for(var type in ProductType.types.takeWhile((value) => value != ProductTypes.cereal.name)){
                                  pixels += ((widget.productsData.where((element) => element.type.typeStr == type).length / 2).ceil() * 257) + (18 * 6);
                                }
                                _scrollController.animateTo(
                                  pixels, 
                                  duration: Duration(milliseconds: (pixels * 0.1).toInt()), 
                                  curve: Curves.ease
                                );
                              },
                              child: Text(
                                'Каша',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.eclairs) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){
                                double pixels = 335;
                                for(var type in ProductType.types.takeWhile((value) => value != ProductTypes.salads.name)){
                                  pixels += ((widget.productsData.where((element) => element.type.typeStr == type).length / 2).ceil() * 257) + (18 * 7);
                                }
                                _scrollController.animateTo(
                                  pixels, 
                                  duration: Duration(milliseconds: (pixels * 0.1).toInt()), 
                                  curve: Curves.ease
                                );
                              },
                              child: Text(
                                'Салаты',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.salads) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){
                                double pixels = 335;
                                for(var type in ProductType.types.takeWhile((value) => value != ProductTypes.quiche.name)){
                                  pixels += ((widget.productsData.where((element) => element.type.typeStr == type).length / 2).ceil() * 257) + 50;
                                }
                                _scrollController.animateTo(
                                  pixels, 
                                  duration: Duration(milliseconds: (pixels * 0.1).toInt()), 
                                  curve: Curves.ease
                                );
                              },
                              child: Text(
                                'Киш',
                                style: TextStyle(fontFamily: 'Podkova', fontWeight: (currentType == ProductTypes.quiche) ? FontWeight.w800 : FontWeight.w400, fontSize: 18, color: Color.fromARGB(255, 138, 72, 61))
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 35)),
                            GestureDetector(
                              onTap: (){
                                double pixels = 335;
                                for(var type in ProductType.types.takeWhile((value) => value != ProductTypes.sweets.name)){
                                  pixels += ((widget.productsData.where((element) => element.type.typeStr == type).length / 2).ceil() * 257) + 50 + 257;
                                }
                                _scrollController.animateTo(
                                  pixels, 
                                  duration: Duration(milliseconds: (pixels * 0.1).toInt()), 
                                  curve: Curves.ease
                                );
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
                      AutoHeightGridView(
                        itemCount: widget.productsData.where((element) => element.type.typeStr == ProductTypes.coffee.name).length,
                        shrinkWrap: true,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 45,
                        builder: (context, index) {
                          return Product(data: widget.productsData.where((element) => element.type.typeStr == ProductTypes.coffee.name).elementAt(index));
                        },
                      ),
                      Center(
                        child: Text(
                          'НАПИТКИ',
                          style: TextStyle(fontFamily: 'Pacifico', fontWeight: (currentType == ProductTypes.sweets) ? FontWeight.w400 : FontWeight.w400, fontSize: 30, color: Color.fromARGB(255, 138, 72, 61))
                        )
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 45,
                        childAspectRatio: 0.65,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for(var product in widget.productsData.where((element) => element.type.typeStr == ProductTypes.drinks.name))
                            Product(data: product)
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Center(
                        child: Text(
                          'ЭКЛЕРЫ',
                          style: TextStyle(fontFamily: 'Pacifico', fontWeight: (currentType == ProductTypes.sweets) ? FontWeight.w400 : FontWeight.w400, fontSize: 30, color: Color.fromARGB(255, 138, 72, 61))
                        )
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 45,
                        childAspectRatio: 0.65,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for(var product in widget.productsData.where((element) => element.type.typeStr == ProductTypes.eclairs.name))
                            Product(data: product)
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Center(
                        child: Text(
                          'КУКИС',
                          style: TextStyle(fontFamily: 'Pacifico', fontWeight: (currentType == ProductTypes.sweets) ? FontWeight.w400 : FontWeight.w400, fontSize: 30, color: Color.fromARGB(255, 138, 72, 61))
                        )
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 45,
                        childAspectRatio: 0.65,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for(var product in widget.productsData.where((element) => element.type.typeStr == ProductTypes.cookie.name))
                            Product(data: product)
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Center(
                        child: Text(
                          'СЭНДВИЧИ',
                          style: TextStyle(fontFamily: 'Pacifico', fontWeight: (currentType == ProductTypes.sweets) ? FontWeight.w400 : FontWeight.w400, fontSize: 30, color: Color.fromARGB(255, 138, 72, 61))
                        )
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 45,
                        childAspectRatio: 0.65,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for(var product in widget.productsData.where((element) => element.type.typeStr == ProductTypes.sandwiches.name))
                            Product(data: product)
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Center(
                        child: Text(
                          'КРУАССАНЫ',
                          style: TextStyle(fontFamily: 'Pacifico', fontWeight: (currentType == ProductTypes.sweets) ? FontWeight.w400 : FontWeight.w400, fontSize: 30, color: Color.fromARGB(255, 138, 72, 61))
                        )
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 45,
                        childAspectRatio: 0.65,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for(var product in widget.productsData.where((element) => element.type.typeStr == ProductTypes.croissants.name))
                            Product(data: product)
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Center(
                        child: Text(
                          'КАША',
                          style: TextStyle(fontFamily: 'Pacifico', fontWeight: (currentType == ProductTypes.sweets) ? FontWeight.w400 : FontWeight.w400, fontSize: 30, color: Color.fromARGB(255, 138, 72, 61))
                        )
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 45,
                        childAspectRatio: 0.65,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for(var product in widget.productsData.where((element) => element.type.typeStr == ProductTypes.cereal.name))
                            Product(data: product)
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Center(
                        child: Text(
                          'САЛАТЫ',
                          style: TextStyle(fontFamily: 'Pacifico', fontWeight: (currentType == ProductTypes.sweets) ? FontWeight.w400 : FontWeight.w400, fontSize: 30, color: Color.fromARGB(255, 138, 72, 61))
                        )
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 45,
                        childAspectRatio: 0.65,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for(var product in widget.productsData.where((element) => element.type.typeStr == ProductTypes.salads.name))
                            Product(data: product)
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Center(
                        child: Text(
                          'КИШ',
                          style: TextStyle(fontFamily: 'Pacifico', fontWeight: (currentType == ProductTypes.sweets) ? FontWeight.w400 : FontWeight.w400, fontSize: 30, color: Color.fromARGB(255, 138, 72, 61))
                        )
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 45,
                        childAspectRatio: 0.65,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for(var product in widget.productsData.where((element) => element.type.typeStr == ProductTypes.quiche.name))
                            Product(data: product)
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Center(
                        child: Text(
                          'СЛАДОСТИ',
                          style: TextStyle(fontFamily: 'Pacifico', fontWeight: (currentType == ProductTypes.sweets) ? FontWeight.w400 : FontWeight.w400, fontSize: 30, color: Color.fromARGB(255, 138, 72, 61))
                        )
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 45,
                        childAspectRatio: 0.65,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          for(var product in widget.productsData.where((element) => element.type.typeStr == ProductTypes.sweets.name))
                            Product(data: product)
                        ],
                      ),
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
