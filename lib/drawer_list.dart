import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Tiago Geanezini'),
            accountEmail: Text('mail@provider.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/dog2.png'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoritos'),
            subtitle: Text('Seus favoritos num só lugar'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Ajuda'),
            subtitle: Text('Clique para mais informações'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
