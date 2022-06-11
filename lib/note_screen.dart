import '/screens/add_note.dart';
import '/screens/display_note.dart';
import 'package:flutter/material.dart';

import 'db/database_provider.dart';
import 'model/note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getNotes() async {
    final notes = await DatabaseProvider.db.getNotes();
    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("일기장"),
        actions: <Widget>[
          new IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/homepage', (route) => false);
            },
            icon: new Icon(Icons.home),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getNotes(),
        builder: (context, noteData) {
          switch (noteData.connectionState) {
            case ConnectionState.waiting:
              {
                return Center(child: CircularProgressIndicator());
              }
            case ConnectionState.done:
              {
                if (noteData.data == Null) {
                  return Center(
                    child: Text("비어있음"),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: (noteData.data as List).length,
                      itemBuilder: (context, index) {
                        String title = (noteData.data as List)[index]['title'];
                        String body = (noteData.data as List)[index]['body'];
                        String creation_date =
                            (noteData.data as List)[index]['creation_date'];
                        int id = (noteData.data as List)[index]['id'];
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "/ShowNote",
                                arguments: NoteModel(
                                  title: title,
                                  body: body,
                                  creation_date: DateTime.parse(creation_date),
                                  id: id,
                                  name: widget.name,
                                )
                              );
                            },
                            title: Text(title),
                            subtitle: Text(body),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
            default:
              return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNote(name: widget.name)));
        },
        child: Icon(Icons.note_add),
      ),
    );
  }
}
