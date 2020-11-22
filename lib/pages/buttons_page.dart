import 'package:flutter/material.dart';
import 'package:rest_flutter/components/page_component.dart';
import 'package:rest_flutter/models/button_model.dart';
import 'package:rest_flutter/rest_api/provider/button_provider.dart';
import 'package:rest_flutter/utils/custom_drawer.dart';
import 'package:rest_flutter/widgets/button_widget.dart';

class ButtonsPage extends StatelessWidget with PageComponent {
  static const String ROUTE = '/buttons';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonPage"),
      ),
      drawer: CustomDrawer.getDrawer(context),
      body: futureBuilder(ButtonProvider().getButtons,ButtonWidget.build, context)//Column(children: buildWidgets(getData(), ButtonWidget.build)),
    );
  }

  /*
    * listado asincrono de botones (RestAPI)
   */

 /* Widget _futureBuilder() {
    return FutureBuilder(
      future: ButtonProvider.getButtons(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ButtonModel>> buttonsSnap) {
        if (buttonsSnap.hasData) {
          return Column(
              children: buildWidgets(buttonsSnap.data, ButtonWidget.build));
        }else{
          print("Cargando");
          return CircularProgressIndicator();
        }
      },
    );
  }*/

  /*
    * Obtiene la data y compone el modelo
   */

  List<ButtonModel> getData() {
    List<ButtonModel> buttonModels = List();

    for (int i = 0; i < 3; i++)
      buttonModels.add(
          ButtonModel.constructor("Flat $i", "FFFF0000", "FFFFFFFF", "flat"));

    for (int i = 0; i < 3; i++)
      buttonModels.add(ButtonModel.constructor(
          "Raised $i", "FF00FF00", "FFFFFFFF", "raised"));

    return buttonModels;
  }
}
