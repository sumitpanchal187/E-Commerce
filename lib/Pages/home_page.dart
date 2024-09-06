import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_projects/Models/cartModel.dart';
import 'package:flutter_projects/Models/catalogModel.dart';
import 'package:flutter_projects/Pages/home_detail_page.dart';
import 'package:flutter_projects/Routes/MyRoutes.dart';
import 'package:flutter_projects/Widgets/Themes.dart';
import 'package:flutter_projects/Widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Widgets/add_to_cart.dart';
import '../Widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => catalogModel.items[0]);
    const int days = 30;
    const String name = "Sumit Panchal";

    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        // appBar: AppBar(title: Text("CataLog App"),),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
          backgroundColor: MyTheme.darkBlueColor,
        child: Icon(CupertinoIcons.cart,color: Colors.white,),),
        body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  if (catalogModel.items != null &&
                      catalogModel.items.isNotEmpty)
                    CatalogList().expand()
                  else
                    CircularProgressIndicator().py16(),
                ],
              )),
        ),
    drawer: MyDrawer(),
    );
  }

  void loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJson);
    var decodeData = jsonDecode(catalogJson);
    // print(decodeData);
    var productData = decodeData["products"];
    catalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    print(productData);
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl3.bold.color(MyTheme.darkBlueColor).make(),
        "Trending Products".text.semiBold.color(MyTheme.darkBlueColor).make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = catalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog ));
      },
      itemCount: catalogModel.items.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
           tag: Key(catalog.id.toString()),
          child: Image.network(catalog.image)
              .box
              .rounded
              .p8
              .color(MyTheme.creamColor)
              .make()
              .p16()
              .w32(context),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            4.heightBox,
            catalog.name.text.bold.color(MyTheme.darkBlueColor).make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),

            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.all(8.0),
              children: [
                "\$ ${catalog.price}".text.bold.xl.make(),
                AddToCart(catalog: catalog,)
              ],
            )
          ],
        ))
      ],
    )).white.rounded.square(120).make().py16();
  }
}
