import 'package:flutter/material.dart';
import 'package:rest_flutter/components/page_component.dart';
import 'package:rest_flutter/models/button_model.dart';
import 'package:rest_flutter/models/group_model.dart';
import 'package:rest_flutter/pages/mix_page.dart';
import 'package:rest_flutter/rest_api/provider/button_provider.dart';
import 'package:rest_flutter/rest_api/provider/group_provider.dart';
import 'package:rest_flutter/utils/custom_drawer.dart';

class GroupsPage extends StatelessWidget with PageComponent {
  static const String ROUTE = '/groups';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Grupos"),
        ),
        drawer: CustomDrawer.getDrawer(context),
        body:
            _futureBuilder() //Column(children: buildWidgets(getData(), ButtonWidget.build)),
        );
  }

  /*
    * listado asincrono de botones (RestAPI)
   */

  Widget _futureBuilder() {

    final groupProvider = GroupProvider();

    return FutureBuilder(
      future: groupProvider.getGroups(),
      builder:
          (BuildContext context, AsyncSnapshot<List<GroupModel>> groupsSnap) {
        if (groupsSnap.hasData) {
          List<Widget> buttons = List();

          groupsSnap.data.forEach((group) {
            buttons.add(RaisedButton(
              child: Text(group.name),
              onPressed: () {
                Navigator.pushNamed(context, MixPage.ROUTE, arguments: group);
              },
            ));
          });

          return Column(children: buttons);
        } else {
          print("Cargando");
          return CircularProgressIndicator();
        }
      },
    );
  }
}
