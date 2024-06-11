import 'dart:io';
import 'dart:convert';

import 'package:any_time/pages/home_page.dart';
import 'package:any_time/product_data.dart';
import 'package:any_time/utils/parser.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:html/dom.dart' as dom;

class Splash extends StatefulWidget{
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>{
  static const String url = 'www.coffee-anytime.ru';
  static const String productsJsonPath = 'json/products.json';

  static const List<String> dirs = ['json', 'images', 'images/products', 'uploads', 'uploads/images'];

  late final List<ProductData> _products;

  @override
  void initState(){
    super.initState();
    createApplicationEnvironment();
    fetchData();
    navigate();
  }

  void createApplicationEnvironment() async { //rework
    final Directory localDir = (await getApplicationDocumentsDirectory());

    for(var dirPath in dirs){
      Directory dir = Directory('${localDir.path}/$dirPath');
      if(!await dir.exists()){
        await dir.create();
      }
    }
  }

  void fetchData() async {
    Parser parser = Parser();
    await parser.fetchData(url);

    final Directory localDir = (await getApplicationDocumentsDirectory());

    File productsFile = File('${localDir.path}/$productsJsonPath');

    if(!await productsFile.exists()){
      await productsFile.create();
    }

    if(parser.html != null){
      List<ProductData> products = List.empty(growable: true);
      for(var containerName in ProductType.types){ // Парсинга добавок не будет...
        var container = parser.html!.getElementById(containerName);
        if(container != null){
          for(var element in container.getElementsByClassName('products__item')){
            ProductData product = ProductData.validateFrom(
              type: ProductType.from(containerName),
              name: element.getElementsByClassName('products__name').first.text,
              weightStr: element.getElementsByClassName('products__weight').first.text,
              priceStr: element.getElementsByClassName('products__price').first.text,
              imageName: element.getElementsByTagName('img').first.attributes['data-src'] ?? "",
              imageFullPath: '${localDir.path}/${(element.getElementsByTagName('img').first.attributes['data-src'] ?? "").replaceFirst('/', '')}'
            );
            print(product.imageFullPath);
            products.add(product);
          }
        }
      }

      var encodedProducts = json.encode(products);

      await productsFile.writeAsString(encodedProducts);

      for(var product in products){
        Parser.saveImageFromUrl(url, product.imageName.replaceFirst('/', ''));
      }
    }

    final String productsData = await productsFile.readAsString();

    List<dynamic> decoded = jsonDecode(productsData);
    List<ProductData> products = List<ProductData>.from(decoded.map((dynamic i) => ProductData.fromJson(i)));

    _products = List.from(products);
  }

  void navigate() async {
    await Future.delayed(Duration(milliseconds: 5000));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(title: 'Home', productsData: _products,)));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center( 
        child:  ElevatedButton( 
          child: Text("tmpStr"),
          onPressed: () { setState(() {
            //fetchData();
          }); },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 0, 0)),
            //minimumSize: MaterialStateProperty.all(Size.fromWidth(15))
          ),
        ),//Image(image: AssetImage("assets/images/neco-arc-neco.gif"), width: 92, height: 117),
      ),
      backgroundColor: Color.fromARGB(255, 38, 38, 38),
    );
  }
}
