import 'package:flutter/material.dart';
import 'package:rest_flutter/pages/buttons_page.dart';
import 'package:rest_flutter/pages/chips_page.dart';
import 'package:rest_flutter/pages/dragable/card_page.dart';
import 'package:rest_flutter/pages/groups_page.dart';
import 'package:rest_flutter/pages/images_page.dart';
import 'package:rest_flutter/pages/login_page.dart';
import 'package:rest_flutter/pages/mix_page.dart';
import 'package:rest_flutter/pages/notes/list_page.dart';
import 'package:rest_flutter/pages/notes/save_page.dart';
import 'package:rest_flutter/pages/texts_page.dart';
import 'package:rest_flutter/rest_api/provider/user_provider.dart';
import 'package:rest_flutter/utils/user_preference.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  final userPreference = UserPreference();
  await userPreference.initPreferences();

  /*var initialRoute = LoginPage.ROUTE;
  if(userPreference.token != "" && await UserProvider.verify()){
    initialRoute = GroupsPage.ROUTE;
  }*/

  final initialRoute = userPreference.token != '' && await UserProvider.verify() ? CardPage.ROUTE : LoginPage.ROUTE;

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {

  final String initialRoute;

  const MyApp({this.initialRoute}) : super();
  
  @override
  Widget build(BuildContext context) {

    final userPreference = UserPreference();

    print(userPreference.token);

    return MaterialApp(
      initialRoute: initialRoute,
      routes: {
        ChipsPage.ROUTE: (BuildContext context) => ChipsPage(),
        ButtonsPage.ROUTE: (BuildContext context) => ButtonsPage(),
        TextsPage.ROUTE: (BuildContext context) => TextsPage(),
        ImagesPage.ROUTE: (BuildContext context) => ImagesPage(),
        MixPage.ROUTE: (BuildContext context) => MixPage(),
        GroupsPage.ROUTE: (BuildContext context) => GroupsPage(),
        ListPage.ROUTE: (BuildContext context) => ListPage(),
        SavePage.ROUTE: (BuildContext context) => SavePage(),
        LoginPage.ROUTE: (BuildContext context) => LoginPage(),
        CardPage.ROUTE: (BuildContext context) => CardPage()
      },
    );
  }
}