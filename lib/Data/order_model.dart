class OrderDataModel {
  String? image;
  String? title_two;
  String? title_one;
  double? price;
  List<Size>? sizes;
  List<Addition>? additions;

  OrderDataModel(Map map){
    image = map["image"];
    title_one = map["title_one"];
    title_two = map["title_two"];
    price=map["price"];

  List <Map> sizeMapList = map["sizes"];
   sizes = sizeMapList.map((e) => Size(e)).toList();

    List<Map> additionMapList = map["additions"];
   additions= additionMapList.map((e) => Addition(e)).toList();

  }
}

class Size {
  String? size;
  double? sizePrice;

  Size(Map map){
    size = map["size"];
    sizePrice =map["price"];
  }


}

class Addition {
  String? addition;
  double? sizePrice;

  Addition(Map map){
    addition = map["addition"];
    sizePrice = map["price"];
  }

}