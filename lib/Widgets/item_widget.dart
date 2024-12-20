import 'package:flutter_projects/Models/catalogModel.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {

  final Item item;

  const ItemWidget({Key? key, required this.item}) :
        assert(item!=null),
        super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: StadiumBorder(),
       elevation: 2.0,
      child: ListTile(
        onTap: (){
          print("${item.name} is pressed");
        },
         leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$ ${item.price}",
        textScaleFactor: 1.3,
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
    );
  }
}
