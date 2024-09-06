import 'package:flutter_projects/Pages/home_page.dart';
import 'package:flutter_projects/Widgets/drawer.dart';

class catalogModel{

  static final catModel  = catalogModel._internal();
  catalogModel._internal();

  factory catalogModel() => catModel;

  static List<Item> items = [Item(id: 1,name: "Iphone 12 pro max", desc: "new Iphone with charger",price:  69999 , color: "#33505a",
    image: "https://www.366icons.com/media/01/profile-avatar-account-icon-16699.png")
  ];


  Item getById(int id) =>
      items.firstWhere((element) => element.id == id,orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});

  factory Item.fromMap(Map<String,dynamic> map)
  {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
  toMap() => {
    "id" : id,
    "name" : name,
    "desc" : desc,
    "price" : price,
    "color" : color,
    "image" : image
  };
}
