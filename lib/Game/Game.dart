import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtap/Game/Card.dart';
import 'package:mtap/Pages/DecksPage.dart';
import 'package:mtap/Requests.dart';

import '../ObjectData.dart';

class Game extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>GameState();

}
class GameState extends State<Game> {
  DeckData deck;
  List<Widget> fieldCards;
  Function createDeckSelectFunc(int index){
    return (){
      deck = GlobalContainer.user.decks[index];
      Navigator.of(context).pop();
    };
  }
  Widget deckSelect(){
    return AlertDialog(
      content: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
          crossAxisCount: 5,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(GlobalContainer.user.decks.length, (index) => DeckIconWidget(index,createDeckSelectFunc(index)))
      ),

    );
  }


  @override
  void initState() {
    super.initState();
    showDialog(context: context,
        builder: (BuildContext context)=> deckSelect());




    fieldCards=List();

  }
  void draw(){

  }
  void shuffle(){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: <Widget>[
           RawKeyboardListener(
             onKey: (key){
               if(key.character=='c'){
                 draw();
               }else if(key.character=='v'){
                 shuffle();
               }

             },

           ),

           Stack(
              children:fieldCards+<Widget>[
                Positioned(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: null,
                  ),
                )
              ]
      ),
         ],
       ),
    );
  }
}