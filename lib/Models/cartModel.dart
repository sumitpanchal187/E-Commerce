import 'package:flutter_projects/Models/catalogModel.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{

  static final cartModel = CartModel._internal();
  CartModel._internal();

  factory CartModel() => cartModel;

  late catalogModel _catalog;


  // store id of each products
  final List<int> _itemIds = [];

  catalogModel get catalog => _catalog;

  set catalog(catalogModel newCatalog){
    assert(newCatalog!=null);
    _catalog = newCatalog;
  }


  // get item in the cart

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();


  num get totalPrice => items.fold(0, (total,current)=> total+current.price);

  // add item to cart
  void add (Item item){
    _itemIds.add(item.id);
  }


  // remove item from the cart

  void remove(Item item){
    _itemIds.remove(item.id) ;
  }



}