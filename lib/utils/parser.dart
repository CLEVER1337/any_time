import 'dart:io';

import 'package:any_time/product_data.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:path_provider/path_provider.dart';

class Parser{
  late dom.Document? html;

  Parser();

  Future<void> fetchData(String url) async{ 
    http.Response response = await http.get(Uri.https(url));

    if(response.statusCode == 200){
      dom.Document document = parser.parse(response.body);
      html = document;
      //text = document.getElementById('coffee')!.getElementsByClassName('products__item')[0].getElementsByClassName('products__name')[0].text;
      print(html);
      print(ProductType.types);
    }
    else{
      html = null;
    }
  }

  static Future<void> saveImageFromUrl(String url, String imagePath) async {
    final Directory localDir = await getApplicationDocumentsDirectory();

    http.Response response = await http.get(Uri.https(url, '/$imagePath'));

    if(response.statusCode == 200){
      final File imageFile = File('${localDir.path}/$imagePath');
      if(!await imageFile.exists()){
        await imageFile.create();
      }
      await imageFile.writeAsBytes(response.bodyBytes);
    }
  }
}
