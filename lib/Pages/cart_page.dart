  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/Models/cartModel.dart';
import 'package:flutter_projects/Widgets/Themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart"),
      ),
      body: Column(
        children: [
      _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(context.accentColor).make(),
          30.widthBox,
         ElevatedButton(onPressed: () {
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported yet.".text.make()));
         }, child: "Buy".text.white.bold.make(),
         style: ButtonStyle(
           backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent)
         )
         ).w32(context)

        ],
      ),
    );
  }
}


class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty? "Nothing to show here".text.xl3.makeCentered():ListView.builder(itemBuilder: (context,index)=>
        ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(onPressed: (){
            _cart.remove(_cart.items[index]);
            setState(() {

            });
          }, icon: Icon(Icons.remove_circle_outlined)
          ),
          title: _cart.items[index].name.text.make(),
        )
      ,itemCount: _cart.items.length,);
  }
}
