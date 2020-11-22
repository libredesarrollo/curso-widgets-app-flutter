import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rest_flutter/models/note_model.dart';
import 'package:rest_flutter/pages/notes/save_page.dart';
import 'package:rest_flutter/rest_api/provider/note_provider.dart';

class ListPage extends StatefulWidget {
  static const String ROUTE = '/note-list';

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<NoteModel> items = [];
  bool isLoading = false;
  int currentPage = 0;

  @override
  void initState() {
    /*for (var i = 0; i < 50; i++) {
      items.add("Item $i");
    }*/

    _loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, SavePage.ROUTE,arguments: NoteModel.empty());
        },
      ),
      appBar: AppBar(
        title: Text("Notas"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (currentPage < NoteProvider.lastPage &&
                  !isLoading &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                _loadData();

                setState(() {
                  isLoading = true;
                });
              }

              return true;
            },
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _createItem(index);
              },
            ),
          )),
          Container(
            height: isLoading ? 50.0 : 0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget _createItem(int index) {
    return Slidable(
      actionExtentRatio: 0.25,
      child: ListTile(title: Text(items[index].title)),
      actionPane: SlidableStrechActionPane(),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Borrar',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            setState(() {
              NoteProvider.deleteNote(items[index].id);
              items.removeAt(index);
            });
          },
        ),
        IconSlideAction(
          caption: 'Editar',
          color: Colors.blueGrey,
          icon: Icons.edit,
          onTap: () {
            Navigator.pushNamed(context, SavePage.ROUTE, arguments: items[index]);
          },
        ),
      ],
    );
  }

  Future _loadData() async {
    // await Future.delayed(Duration(seconds: 3));

    //if(currentPage < NoteProvider.lastPage || NoteProvider.lastPage == 0)
    currentPage++;
    print(currentPage);
    List<NoteModel> auxItems = await NoteProvider.getNotes(currentPage);

    setState(() {
      items.addAll(auxItems);

      /* items.addAll([
        "New Item ${items.length}",
        "New Item ${items.length}",
        "New Item ${items.length}",
        "New Item ${items.length}"
      ]);*/
      isLoading = false;
    });
  }
}
