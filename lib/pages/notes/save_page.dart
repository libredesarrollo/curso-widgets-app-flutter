import 'package:flutter/material.dart';
import 'package:rest_flutter/models/note_model.dart';
import 'package:rest_flutter/rest_api/provider/note_provider.dart';

class SavePage extends StatefulWidget {
  static const String ROUTE = '/note-save';

  @override
  _SavePageState createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  String titleError = "";
  String contentError = "";

  NoteModel noteModel;

  @override
  Widget build(BuildContext context) {

    noteModel = ModalRoute.of(context).settings.arguments;

    print("_____");
    print(noteModel.id);

    titleController.text = noteModel.title;
    contentController.text = noteModel.content;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Crear Nota"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: titleController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              errorText: titleError == "" ? null : titleError,
                              labelText: "Título",
                              hintText: "Título"),
                          validator: (value) {
                            if (value.isEmpty)
                              return "Por favor, coloque algo de texto";
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: contentController,
                          maxLines: 8,
                          maxLength: 1000,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              errorText:
                                  contentError == "" ? null : contentError,
                              labelText: "Contenido",
                              hintText: "Contenido"),
                          validator: (value) {
                            if (value.isEmpty)
                              return "Por favor, coloque algo de texto";
                            return null;
                          },
                        ),
                        RaisedButton(
                          child: Text("Enviar"),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              createNote();
                            }
                          },
                        )
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  createNote() async {
    contentError = "";
    titleError = "";

    final Map map = await NoteProvider.saveNote(
        titleController.text, contentController.text, noteModel.id);

    if (map['code'] != 200) {
      if (map['title'] != null) {
        titleError = map['title'];
      }
      if (map['content'] != null) {
        contentError = map['content'];
      }
    } else {
      final sb = SnackBar(content: Text('Nota creada con éxito'));
      _scaffoldKey.currentState.showSnackBar(sb);
    }

    setState(() {});
  }
}
