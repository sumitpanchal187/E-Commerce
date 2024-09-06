import 'package:flutter_projects/Models/cartModel.dart';
import 'package:flutter_projects/Models/catalogModel.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore
{
  late catalogModel catalog ;
  late CartModel cart ;

  MyStore(){
    catalog = catalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}