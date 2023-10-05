import 'package:database_bloc_note/note_model.dart';

abstract class NoteEvent{}
class AddNoteEvent extends NoteEvent{
  Note_model  newNote;
  AddNoteEvent({required this.newNote});
}
class FetchNoteEvent extends NoteEvent{
}
class deleteNoteEvent extends NoteEvent{
  int index;
   deleteNoteEvent({required this.index});
}
class updateNoteEvent extends NoteEvent{
  Note_model update_model;
  updateNoteEvent({required this.update_model});
}