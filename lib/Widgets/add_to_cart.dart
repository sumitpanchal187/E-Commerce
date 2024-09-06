
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/cartModel.dart';
import '../Models/catalogModel.dart';
import 'Themes.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({super.key,required this.catalog});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog)??false;
    return ElevatedButton(
        onPressed: () {
          if(!isInCart) {
            isInCart = isInCart.toggle();
            final _catalog = catalogModel();
            _cart.catalog = _catalog;
            _cart.add(widget.catalog);
            setState(() {});
          }
        },

        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(MyTheme.darkBlueColor),
        ),
        child: isInCart? Icon(Icons.done,color: Colors.white,) : Icon(CupertinoIcons.cart_badge_plus,color: Colors.white,));
  }
}
