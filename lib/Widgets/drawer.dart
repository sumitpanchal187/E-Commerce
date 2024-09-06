import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://www.366icons.com/media/01/profile-avatar-account-icon-16699.png";

    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple
                  ),
                accountName: const Text("Sumit Panchal"),
                accountEmail: const Text("panchalsumit187@gmail.com"),
                  // currentAccountPicture: Image.network(imageUrl),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
            )
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white,),
              title: Text("Home"
                  ,textScaleFactor:1.1
                  ,style:TextStyle(

                color: Colors.white
              )),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),
              title: Text("Profile"
                  ,textScaleFactor:1
                  ,style:TextStyle(
                color: Colors.white
              )),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.mail,color: Colors.white,),
              title: Text("Support"
                  ,textScaleFactor:1
                  ,style:TextStyle(
                color: Colors.white
              )),
            ),
          ],
        ),
      ),
    );
  }
}
