import 'package:flutter/material.dart';
import 'package:shepherd/note_screen.dart';

import '../db/database_provider.dart';
import '../model/note_model.dart';

class ShowNote extends StatelessWidget {
  const ShowNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteModel note = ModalRoute.of(context)?.settings.arguments as NoteModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("일기장"),
        actions: [
          IconButton(icon: Icon(Icons.delete),onPressed: (){
            DatabaseProvider.db.deleteNote(note.id);
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomeScreen(name: note.name)), (route) => false);
          },)
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              note.title,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              note.body,
              style: TextStyle(fontSize: 18.0,),
            )
          ],
        ),
      ),
    );
  }
}
