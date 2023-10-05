import 'dart:async';

import 'package:database_bloc_note/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
    });
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          height:200,
          width: 200,
          child:Image.asset('Assets/images/post-it.png')
        ),
      ),
    );
  }
}