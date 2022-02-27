import 'package:flutter/material.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Xylophone();
  }
}

class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);

  @override
  void playSound(int noteNumber){
    var player = Audio.load('assets/note$noteNumber.wav');
    player.play();
  }
  expandedWidgets({required Color color, required int noteNumber}){
  return  Expanded(
      child: GestureDetector(
        onTap: () {
          playSound(noteNumber);
        },
        child: Container(
          color: color,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              '<< Xylophone >>',
              style: TextStyle(color: Colors.orangeAccent, fontSize: 30),
            ),
            backgroundColor: Colors.pinkAccent.shade700,
          ),
          body: Column(
            children: [
              expandedWidgets(noteNumber: 1, color: Colors.orangeAccent),
              expandedWidgets(noteNumber: 2, color: Colors.pinkAccent),
              expandedWidgets(noteNumber: 3, color: Colors.deepPurple),
              expandedWidgets(noteNumber: 4, color: Colors.blue),
              expandedWidgets(noteNumber: 5, color: Colors.green),
              expandedWidgets(noteNumber: 6, color: Colors.red),
              expandedWidgets(noteNumber: 7, color: Colors.blueGrey),
            ],
          ),
        ),
      ),
    );
  }
}
