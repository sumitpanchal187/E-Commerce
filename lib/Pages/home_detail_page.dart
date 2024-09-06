import 'package:flutter/material.dart';
import 'package:flutter_projects/Models/catalogModel.dart';
import 'package:flutter_projects/Widgets/Themes.dart';
import 'package:flutter_projects/Widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Widgets/drawer.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catalog.name),
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar:  ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.all(8.0),
        children: [
          "\$ ${catalog.price}".text.bold.xl3.red800.make(),
          AddToCart(catalog: catalog)
        ],
      ).p32() ,
      body: SafeArea(
        bottom: false ,
        child: Column(
          children: [
            Image.network(catalog.image).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                color: Colors.grey,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.bold.xl4
                        .color(MyTheme.darkBlueColor)
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).make(),
                    10.heightBox,
                    "dsiufyd sidufhsjkdhfs kjdhf sjhdfkjshdfsyfueisy wiruewieyr weryw erw"
                        "eoruw eryiweu rywuer "
                        "er we"
                        "r werwerwerwer".text
                        .textStyle(context.captionStyle).make().p16(),
                  ],
                ).p64(),

              ),
            )
            )
          ],
        ),
      ),
    );

  }
}
