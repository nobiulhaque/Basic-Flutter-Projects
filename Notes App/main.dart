import 'package:flutter/material.dart';
import 'package:notes_app/screens/notes_screen.dart';

void main(){
  runApp(NoatesApp());
}


class NoatesApp extends StatelessWidget {
  const NoatesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noates App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const NotesScreen(),
    );
  }
}
