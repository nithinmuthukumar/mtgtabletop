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
  List<CardData> deck;
  List<Widget> fieldCards;
  List<CardData> hand;
  FocusNode focus;
  Function createDeckSelectFunc(int index){
    return (){
      setState(() {
        deck = List.from(GlobalContainer.user.decks[index].cards);
      });

      Navigator.of(context).pop();
    };
  }
  Widget deckSelect(){
    return AlertDialog(
      content: Container(
        width: double.maxFinite,
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(GlobalContainer.user.decks.length, (index) => DeckIconWidget(index,createDeckSelectFunc(index))),
        ),
      ),

    );
  }


  @override
  void initState() {
    super.initState();

    focus = FocusNode();




    fieldCards=List();
    hand= List();

  }
  void draw(){
    print("draw");

    setState(() {
      CardData d=deck.removeAt(0);
      print("y"+d.imageURI.toString());
      hand.add(d);




    });

  }
  void shuffle(){

  }


  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focus);
    return RawKeyboardListener(
      focusNode: focus,
      onKey: (key){
        print("pressed");
        if(key.runtimeType.toString() == 'RawKeyUpEvent'){
          if(key.data.keyLabel=='c'){
            draw();
          }
        }
      },
      child: Scaffold(
         body: Stack(
          children:fieldCards+<Widget>[
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: SizedBox(
                  child: GameDeck(deck: deck),
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: FractionalOffset.centerLeft,
                child: Column(
                  children: <Widget>[
                    IconButton(
                      icon:Icon(Icons.card_membership),
                      onPressed: (){
                        showDialog(context: context,
                            builder: (BuildContext context)=> deckSelect()
                        );
                      },

                    )
                  ],
                )
              ),
            ),
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  children: [for(CardData v in hand) MagicCard(data: v,initPos: Offset.zero,)]
                ),

              ),
            )
          ]
         ),
       ),
    );
  }
}

class GameDeck extends StatefulWidget{
  final List<CardData> deck;

  const GameDeck({Key key, this.deck}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>GameDeckState();


}
class GameDeckState extends State<GameDeck>{
  @override
  Widget build(BuildContext context) {
    return Card(
      //put card back image
      child: Text(widget.deck!=null?widget.deck.length.toString():"null"),
    );

  }

}