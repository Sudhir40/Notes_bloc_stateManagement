import 'package:database_bloc_note/bloc/note_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

import '../bloc/note_event.dart';
import '../bloc/note_state.dart';
import 'add_note.dart';

class Dashboard extends StatelessWidget{
  var height = [100.0,200.0,150.0,250.0,200.0,];
  var colorlist=[
    Color(0xFFB5C5E5),
    Color(0xFF59CD73),
    Color(0xFF3083BB),
    Color(0xFFEA9D54),
    Color(0xFFE791F5),
    Color(0xFF54EAC0),
  ];
  var time = DateTime.now();
  var titlecontroller = TextEditingController();
  var desccontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    context.read<NoteBloc>().add(FetchNoteEvent());
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),

              child: Center(child: Text('Your notes',style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),)),
            ),
            Expanded(
              child: BlocBuilder<NoteBloc , Note_State>(
                builder: (_,state){
                if (state is NoteLoadingState){
                  return Center(child: CircularProgressIndicator(),);
                }
               else if (state is NoteLoadedState){
                  if(state.arrNotes.length!=0){
                    return
                      MasonryGridView.builder(
                          itemCount:  state.arrNotes.length ,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          gridDelegate:  SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context,index){
                            Color cardcolor= colorlist[index% colorlist.length];
                            if(  state.arrNotes.length ==0){
                              return Container(child: Column(children: [
                                Image.asset('Assets/images/post-it.png'),
                                Text('No data')
                              ],),);
                            }else{
                              return
                                InkWell(onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNote(title: state.arrNotes[index].title,subtitle: state.arrNotes[index].subtitle,note_id: state.arrNotes[index].note_id,)));
                                },
                                  onLongPress: (){
                                   int id =  int.parse((state.arrNotes[index].note_id).toString());
                                  BlocProvider.of<NoteBloc>(context).add(deleteNoteEvent(index: id));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: cardcolor,
                                      borderRadius: BorderRadius.only(topRight:Radius.circular(5),topLeft: Radius.circular(5),bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                                    ),
                                    width: double.infinity,
                                    height:height[index % height.length],
                                    child: Column(
                                      children: [
                                        Center(child: Text('${state.arrNotes[index].title}',style: TextStyle(
                                            fontSize: 20
                                        ),)),
                                        Expanded(child: Container(
                                            margin: EdgeInsets.only(top: 10,right: 3,left: 3,bottom: 5),
                                            child: Stack(children:[
                                              Text('${state.arrNotes[index].subtitle}',
                                                style: TextStyle(fontSize: 10),
                                                textAlign: TextAlign.center,),
                                              Align(alignment:Alignment(1,1),
                                                  child: Text('${DateFormat('dd-MMMyy').format(time)}',
                                                    style: TextStyle(backgroundColor:cardcolor,),))]))),
                                      ],
                                    ),
                                  ),
                                );
                            }
                          }
                      );
                  }else{
                    return Container(child: Center(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                      height:200,
                    width: 200,
                    child: Image.asset('Assets/images/post-it.png')),
                        Text('No Data',style: TextStyle(fontSize: 18),),
                      ],
                    ),),);
                  }


                }else{
                  return Container();
                }
              },),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label:Text('Add new ',style: TextStyle(
            color: Colors.green
        ),),
        icon : Icon(Icons.edit_note_sharp,color: Colors.green,),
        backgroundColor: Color(0xFFECEFF5),
        onPressed: (
            ){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNote()));
        },
      ),
    );
  }
}



/*
   ListView.builder(
              itemCount:  state.arrNotes.length ,
              itemBuilder: (_,index){
                Color cardcolor= colorlist[index% colorlist.length];
               // return
                /*  Container(
                decoration: BoxDecoration(
                  color: cardcolor,
                  borderRadius: BorderRadius.only(topRight:Radius.circular(5),topLeft: Radius.circular(5),bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                ),
               child: Column(children: [
                 Center(child: Text(  state.arrNotes[index].title,
                 ),),
                 Expanded(
                   child: Container(
                     child: Text(state.arrNotes[index].subtitle),
                   ),
                 )
               ],),
          )*/
                ;});
* */