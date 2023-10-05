import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addnotes extends StatelessWidget{


  var titlecontroller = TextEditingController();
  var desccontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add notes'),
      ),
      body: Column(
        children: [
          Text('Add your notes'),
          TextField(controller: titlecontroller,),
          TextField(controller: desccontroller,),
          ElevatedButton(onPressed: (){}, child: Text('Add'))
        ],
      ),
    );
  }
}