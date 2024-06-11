import 'dart:io';

import 'package:any_time/product_data.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Product extends StatefulWidget{
  late final ProductData data;

  Product({super.key, required this.data});

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product>{
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      child: Container(
        height: 270,
        width: 138.94,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image(
                image: FileImage(File(widget.data.imageFullPath)),
                height: 160.61,
                width: 138.94,
                fit: BoxFit.fill,
              ),
            ),
            //Padding(padding: EdgeInsets.only(bottom: 1)),
            Text(
              widget.data.name,
              style: const TextStyle(
                fontFamily: 'Podkova', 
                fontWeight: FontWeight.w500, 
                fontSize: 17, 
                color: Color.fromARGB(255, 138, 72, 61),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
            Text(
              '${widget.data.prices[0]} ${widget.data.priceUnit}',
              style: const TextStyle(
                fontFamily: 'Podkova', 
                fontWeight: FontWeight.w600, 
                fontSize: 18, 
                color: Color.fromARGB(255, 138, 72, 61)
              ),
            )
          ],
        ),
      )
    );
  }
}
