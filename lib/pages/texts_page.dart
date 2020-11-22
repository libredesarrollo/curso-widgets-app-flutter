import 'package:flutter/material.dart';
import 'package:rest_flutter/components/page_component.dart';
import 'package:rest_flutter/models/text_model.dart';
import 'package:rest_flutter/rest_api/provider/text_provider.dart';
import 'package:rest_flutter/utils/custom_drawer.dart';
import 'package:rest_flutter/widgets/text_widget.dart';

class TextsPage extends StatelessWidget with PageComponent{
  static const String ROUTE = '/texts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextPage"),
      ),
      drawer: CustomDrawer.getDrawer(context),
      body: futureBuilder(TextProvider().getTexts,TextWidget.build, context)//Column(children: buildWidgets(getData(),TextWidget.build)),
    );
  }

  /*
    * Obtiene la data y compone el modelo
   */

  List<TextModel> getData() {
    List<TextModel> textModels = List();

    for (int i = 0; i < 5; i++)
      textModels.add(TextModel.constructor("Lorem, ipsum dolor sit amet consectetur adipisicing elit. Odio, consequatur nesciunt! Inventore mollitia necessitatibus incidunt quos sint placeat nobis saepe id maiores aspernatur temporibus explicabo odio sunt, accusamus earum libero! cosa"));

    return textModels;
  }

}
