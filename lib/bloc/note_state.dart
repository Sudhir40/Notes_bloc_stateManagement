import '../note_model.dart';

abstract class Note_State{}
class NoteInitialState extends Note_State{

}
class NoteLoadingState extends Note_State{}
class NoteLoadedState extends Note_State{
  List<Note_model> arrNotes;
  NoteLoadedState ({required this.arrNotes});
}
class NoteErrorState extends Note_State{
  String errormsg;
  NoteErrorState({required this.errormsg});
}