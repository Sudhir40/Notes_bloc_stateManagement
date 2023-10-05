import 'dart:io';

import 'package:database_bloc_note/note_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase{
  Database? databse;
  static final NOTE_TABLE_NAME='note';
  static final NOTE_COLOM_ID ="note_id";
  static final NOTE_TITLE ='title';
  static final NOTE_SUBTITLE = 'subtitle';
  getDB(){
    if (databse !=null){
      return databse;
    }else {
      return initDB();
    }
  }
 Future<Database> initDB()async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    var dbpath = join(documentDirectory.path,'noteDB');
    return openDatabase(
     dbpath,
      version: 1,
      onCreate: (db , version){
       db.execute('create table $NOTE_TABLE_NAME ($NOTE_COLOM_ID integer primary key autoincrement,$NOTE_TITLE text,$NOTE_SUBTITLE text)');
      }
    );
  }
  Future<bool>addnote (Note_model model )async{
    var db =await  getDB();
    var roweffect = await db.insert(NOTE_TABLE_NAME,model.tomap());
    if(roweffect>0){
      return true;
    }else{
      return false;
    }
  }
  Future  < List<Note_model>> fetchdata()async{
    var db =await getDB();
    List<Map<String , dynamic>>notes =await  db.query(NOTE_TABLE_NAME);
    List<Note_model>notelist=[];
    for(Map<String,dynamic>note in notes){
      notelist.add(Note_model.fromMap(note));
    }return notelist;
  }
  Future<bool> deleteNote(int index)async{
    var db = await getDB();
    var count = await db.delete(NOTE_TABLE_NAME,where:'$NOTE_COLOM_ID=$index');
   return count>0;
  }
  Future<bool>updateNote(Note_model model)async{
    var db = await getDB();
    var count = await db.update(NOTE_TABLE_NAME,model.tomap(),where:'$NOTE_COLOM_ID=${model.note_id}');
    return count>0;
  }
}