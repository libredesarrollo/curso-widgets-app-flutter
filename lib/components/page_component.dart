import 'package:flutter/material.dart';

mixin PageComponent {
  List<Widget> buildWidgets(List models, Function build, BuildContext context) {
    List<Widget> widgets = <Widget>[];
    for (var model in models) {
      widgets.add(build(model, context));
    }

    return widgets;
  }

  Widget buildWidget(Object model, Function build, BuildContext context) =>
      build(model, context);

  Widget futureBuilder(Function future, Function build, BuildContext context) {
    return FutureBuilder(
      future: future(),
      builder: (BuildContext context, AsyncSnapshot<List> buttonsSnap) {
        if (buttonsSnap.hasData) {
          return Column(
              children: buildWidgets(buttonsSnap.data!, build, context));
        } else {
          print("Cargando");
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget futureBuilderMix(Function future, int groupId, BuildContext context) {
    return FutureBuilder(
      future: future(groupId),
      builder: (BuildContext context, AsyncSnapshot<List> buttonsSnap) {
        if (buttonsSnap.hasData) {
          final mixsModel = buttonsSnap.data!;
          List<Widget> widgets = <Widget>[];

          for (var mix in mixsModel) {
            widgets.add(buildWidget(mix.object, mix.object.fun, context));
          }

          return Column(children: widgets);
        } else {
          print("Cargando");
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget futureBuilderMixUrl(Function future, String url, BuildContext context) {
    return FutureBuilder(
      future: future(url),
      builder: (BuildContext context, AsyncSnapshot<List> buttonsSnap) {
        if (buttonsSnap.hasData) {
          final mixsModel = buttonsSnap.data!;
          List<Widget> widgets = <Widget>[];

          for (var mix in mixsModel) {
            widgets.add(buildWidget(mix.object, mix.object.fun, context));
          }

          return Column(children: widgets);
        } else {
          print("Cargando");
          return CircularProgressIndicator();
        }
      },
    );
  }
}
