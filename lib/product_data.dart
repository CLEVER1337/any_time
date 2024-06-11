class ProductData{
  late final ProductType type;
  late final String name;
  late final String weightUnit;
  late final List<int> weights;
  final String priceUnit = 'р.';
  late final List<int> prices;

  String _imageName = "";

  late final String imageFullPath;

  String get imageName{
    return _imageName;
  }

  ProductData({
    required this.type, 
    required this.name, 
    required this.weightUnit, 
    required this.weights, 
    required this.prices,
    required this.imageFullPath,
    required String imageName
  }){
    _imageName = imageName;
  }

  ProductData.validateFrom({
    required this.type, 
    required this.name, 
    required this.imageFullPath,
    required String weightStr, 
    required String priceStr, 
    required String imageName,
  }){
    _imageName = imageName;

    List<int> tmpWeights = List.empty(growable: true);
    List<int> tmpPrices = List.empty(growable: true);

    for(var str in weightStr.split(' ')){
      int? weight = int.tryParse(str);
      if(weight != null){
        tmpWeights.add(weight);
      }
    }
    weights = List.from(tmpWeights);
    weightUnit = weightStr.split(' ').last;

    for(var str in priceStr.split(' ')){
      int? price = int.tryParse(str);
      if(price != null){
        tmpPrices.add(price);
      }
    }
    prices = List.from(tmpPrices);
  }

  ProductData.withoutImage({
    required this.type, 
    required this.name, 
    required this.weightUnit, 
    required this.weights, 
    required this.prices
  });

  factory ProductData.fromJson(Map<String, Object?> jsonMap){
    return ProductData(
      type: ProductType.from(jsonMap["type"] as String), 
      name: jsonMap["name"] as String, 
      weightUnit: jsonMap["weightUnit"] as String,
      weights: List<int>.from(jsonMap["weights"] as List<dynamic>), 
      prices: List<int>.from(jsonMap["prices"] as List<dynamic>), 
      imageFullPath: jsonMap["imageFullPath"] as String,
      imageName: jsonMap["imageName"] as String,
    );
  }

  Map toJson() => {"type": type.typeStr, "name": name, "weightUnit": weightUnit, "weights": weights, "prices": prices, "imageName": _imageName, "imageFullPath": imageFullPath};
}

enum ProductTypes{
  coffee,
  drinks,
  eclairs,
  cookie,
  sandwiches,
  croissants,
  cereal,
  salads,
  quiche,
  sweets
}

class ProductType{
  static final List<String> types = List.from(getTypes());// = ['coffee', 'drinks', 'eclairs', 'cookie', 'sandwiches', 'croissants', 'cereal', 'salads', 'quiche', 'sweets'];

  late final String _type;
  String get typeStr {
    return _type;
  }

  ProductType(ProductTypes type){
    _type = type.name;
  }

  ProductType.from(String typeName){
    _type = typeName;
  }

  static List<String> getTypes(){
    List<String> temp = List.empty(growable: true);
    for(var spec in ProductTypes.values){
      temp.add(spec.name);
    }
    return temp;
  }
}
