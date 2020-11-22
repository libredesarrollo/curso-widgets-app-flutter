import 'package:flutter/cupertino.dart';
import 'package:rest_flutter/pages/buttons_page.dart';
import 'package:rest_flutter/pages/chips_page.dart';

import 'package:flutter/material.dart';
import 'package:rest_flutter/pages/groups_page.dart';
import 'package:rest_flutter/pages/images_page.dart';
import 'package:rest_flutter/pages/login_page.dart';
import 'package:rest_flutter/pages/mix_page.dart';
import 'package:rest_flutter/pages/notes/list_page.dart';
import 'package:rest_flutter/pages/texts_page.dart';
import 'package:rest_flutter/rest_api/provider/user_provider.dart';

class _DrawerItem{
  String title;
  IconData icon;
  String route;

  _DrawerItem({this.title, this.icon, this.route});
}

class CustomDrawer {

  static final _optionsItems = [
    _DrawerItem(title: "Grupo", icon:  Icons.settings, route: GroupsPage.ROUTE),
    _DrawerItem(title: "Chip", icon:  Icons.list, route: ChipsPage.ROUTE),
    _DrawerItem(title: "Button", icon:  Icons.list, route: ButtonsPage.ROUTE),
    _DrawerItem(title: "Texto", icon:  Icons.list, route: TextsPage.ROUTE),
    _DrawerItem(title: "Image", icon:  Icons.image, route: ImagesPage.ROUTE),
    _DrawerItem(title: "Notas", icon:  Icons.note, route: ListPage.ROUTE),
  ];

  static Widget getDrawer(BuildContext context){

    List<Widget> items = _optionsItems.map((item) => _createItem(context, item)).toList();

    items.add(_createItemCloseSession(context));

    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey),
            accountEmail: Text("Sin email"),
            accountName: Text("Sin nombre"),
          ),
          Column(
            children: items,
          )
        ],
      ),
    );
  }

  static Widget _createItem(BuildContext context, _DrawerItem item){
    return ListTile(
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: (){
        Navigator.pop(context);
        Navigator.pushNamed(context, item.route);
      },
    );
  }
  static Widget _createItemCloseSession(BuildContext context){
    return ListTile(
      leading: Icon(Icons.close),
      title: Text("Cerrar Sesión"),
      onTap: (){
    
        UserProvider.logout();
        Navigator.pushReplacementNamed(context, LoginPage.ROUTE);
      },
    );
  }

}