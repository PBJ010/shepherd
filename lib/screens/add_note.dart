import 'package:flutter/material.dart';

import '../db/database_provider.dart';
import '../model/note_model.dart';
import '../note_screen.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key, required this.name,}) : super(key: key);
  final String name;

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String? title;
  String? body;
  DateTime? date;

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  addNote(NoteModel note){
    DatabaseProvider.db.addNewNote(note);
    print("note added succesfully");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("새 일기"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "제목",
              ),
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: TextField(
                controller: bodyController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "내용",
                )
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigo,
        onPressed: (){
        setState(() {
          title = titleController.text;
          body = bodyController.text;
          date = DateTime.now();
        });
        NoteModel note = NoteModel(title: title!, body: body!, creation_date: date!, id: DateTime.now().millisecondsSinceEpoch, name: widget.name);
        addNote(note);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomeScreen(name: widget.name)), (route) => false);
      }, label: Text("저장하기"), icon: Icon(Icons.save),),
    );
  }
}
