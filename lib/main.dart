import 'package:flutter/material.dart';
import 'package:hang_man/ui/colors.dart';
import 'package:hang_man/ui/letter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'ui/figures.dart';
import 'ui/game.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home:const Hangman()));
}

class Hangman extends StatefulWidget {
  const Hangman({Key? key}) : super(key: key);

  @override
  State<Hangman> createState() => _HangmanState();
}

class _HangmanState extends State<Hangman> {
  //choose the word as predefined
  String word="FLUTTER";
  //create a list of alphabets
  List<String> alphabets=['A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T','U','V','W','X','Y','Z'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.backgroundcolor,
      appBar: AppBar(title: Text("H A N G _ M A N",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      centerTitle: true,backgroundColor: Colors.black,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(children: [
              figure(Game.chances >= 0,"images/hang.png"),
              figure(Game.chances >= 1,"images/head.png"),
              figure(Game.chances >= 2,"images/body.png"),
              figure(Game.chances >= 3,"images/ra.png"),
              figure(Game.chances >= 4,"images/rl.png"),
              figure(Game.chances >= 5,"images/la.png"),
              figure(Game.chances >= 6,"images/ll.png"),
            ],),
          ),
        SizedBox(height: 20,),
          
        //Now we will build the hidden word widget
          Row(
            children: word.split('').map((e) => letter(e.toUpperCase(),
              !Game.selectedchar.contains(e.toUpperCase()))).toList(),
          ),
          SizedBox(height: 20,),
          GridView.count(
            shrinkWrap: true,
              crossAxisCount: 6,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children:alphabets.map((e){
           return GestureDetector(
             onTap: Game.selectedchar.contains(e)?null
                 :(){
                setState(() {
                  Game.selectedchar.add(e);
                  if(!word.split('').contains(e.toUpperCase())){
                    Game.chances++;
                  /*  Alert(context: context,
                      title:"GAME ALERT",desc: "YOU LOSE",
                      image: Image.asset("images/ROPE.jpg"),
                    *///).//show();
                  }
                });
             },
             child: Padding(
               padding: const EdgeInsets.all(5.0),
               child: Container(
                 height: 100,width: 100,
                 decoration: BoxDecoration(
                     color: Colors.grey,
                   borderRadius: BorderRadius.circular(10)
                 ),
                 child: Center(child: Text(e,style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),)),
               ),
             ),
           );
          }).toList(), ),
          
        ],
      ),
    );
  }
}
