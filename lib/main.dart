import 'package:database_bloc_note/app_database.dart';
import 'package:database_bloc_note/bloc/note_bloc.dart';
import 'package:database_bloc_note/screens/dashboard.dart';
import 'package:database_bloc_note/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
void main() {
  runApp( BlocProvider(
    create: (context)=>NoteBloc(db: AppDatabase()),
    child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:splash_screen()
  
    );
  }
}
