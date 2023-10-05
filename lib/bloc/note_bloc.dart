
import 'package:database_bloc_note/bloc/note_event.dart';
import 'package:database_bloc_note/bloc/note_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_database.dart';
class NoteBloc extends Bloc<NoteEvent,Note_State>{
  AppDatabase db;
NoteBloc({required this.db}) :super (NoteInitialState()){
  ///(Note add)
  on<AddNoteEvent >((event  , emit)async{
    emit(NoteLoadingState());
    bool check = await db.addnote(event.newNote);
    if (check){
      var mArrnotes = await db.fetchdata();
      emit(NoteLoadedState(arrNotes: mArrnotes));
    }else{
      emit (NoteErrorState(errormsg: 'Error'));
    }
  });
  on<FetchNoteEvent >((event  , emit)async{
    var mnotes = await db.fetchdata();
    emit(NoteLoadedState(arrNotes: mnotes));
  });
  on<deleteNoteEvent>((event,emit)async{
    emit(NoteLoadingState());
    bool check = await db.deleteNote(event.index);
    if(check){
      var mnotes = await db.fetchdata();
      emit(NoteLoadedState(arrNotes: mnotes));
    }else{
      emit(NoteErrorState(errormsg: 'Error : not deleted'));
    }
  });
  on<updateNoteEvent>((event,emit)async{
    emit (NoteLoadingState());
    var check = await db.updateNote(event.update_model);
    if(check){
      var updatemodel = await db.fetchdata();
      emit(NoteLoadedState(arrNotes: updatemodel));
    }
  });
}
}