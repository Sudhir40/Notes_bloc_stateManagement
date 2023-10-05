import 'package:database_bloc_note/bloc/note_bloc.dart';
import 'package:database_bloc_note/bloc/note_event.dart';
import 'package:database_bloc_note/note_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddNote extends StatelessWidget{
  String? title;
  int ?note_id;
  String? subtitle;

  AddNote({this.title, this.note_id, this.subtitle});

 var titlecontroller = TextEditingController();
 var desccontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(title!=null&&subtitle!=null&&note_id!=null){
      titlecontroller.text = title.toString();
      desccontroller.text=subtitle.toString();
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Add your notes'),
            TextField(
              controller: titlecontroller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: desccontroller,
           //   keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'write here you notes',
                border: InputBorder.none
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Save',style: TextStyle(
            color: Colors.green
        ),),
        icon: Icon(Icons.save,color: Colors.green,),
        backgroundColor: Color(0xFFECEFF5),
        onPressed: (){
          if(title!=null&&subtitle!=null&&note_id!=null){
            context.read<NoteBloc>().add(updateNoteEvent(update_model: Note_model(
              title: titlecontroller.text.toString(),
              subtitle: desccontroller.text.toString()
            )));
          }else{
          context.read<NoteBloc>().add(AddNoteEvent(newNote: Note_model(
                      title: titlecontroller.text.toString(),
                      subtitle: desccontroller.text.toString())));}
        },),
    );
  }
}