import 'package:database_bloc_note/app_database.dart';

class Note_model{
  String title;
  int ?note_id;
  String subtitle;
  Note_model({required this.title,required this.subtitle,this.note_id});
factory Note_model.fromMap(Map<String,dynamic >map){
  return Note_model(
      title: map['title'],
      subtitle: map['subtitle'],
     note_id: map['note_id']

  );
}
Map<String  , dynamic >tomap(){
  return{
    AppDatabase.NOTE_TITLE:title,
    AppDatabase .NOTE_SUBTITLE:subtitle,
    AppDatabase.NOTE_COLOM_ID:note_id,
  };
}
}