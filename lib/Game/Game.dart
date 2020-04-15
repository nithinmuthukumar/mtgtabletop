import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtap/Game/Card.dart';
import 'package:mtap/Pages/DecksPage.dart';
import 'package:mtap/Requests.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../ObjectData.dart';
import 'Deck.dart';

class Game extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>GameState();

}
class GameState extends State<Game> {
  List<CardData> deck = GlobalContainer.user.decks[0].cards;
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
    setState(() {
      CardData d=deck.removeAt(0);
      hand.add(d);
    });
  }
  void shuffle(){

  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focus);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.card_membership),
            onPressed: (){
              print("pressed");
              showDialog(context: context,
                  builder: (BuildContext context)=> deckSelect()
              );
            },
          ),
        ],
      ),

      body: RawKeyboardListener(
        focusNode: focus,
        onKey: (key){
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
                    child: Deck(deck: deck),
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              Positioned(
                left: 200,
                bottom: 0,
                width: 600,
                height: 100,

                child: ReorderableListView(
                  scrollDirection: Axis.horizontal,
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      // These two lines are workarounds for ReorderableListView problems
                      if (newIndex > hand.length) newIndex = hand.length;
                      if (oldIndex < newIndex) newIndex--;

                      CardData item = hand[oldIndex];
                      hand.remove(item);
                      hand.insert(newIndex, item);
                    });
                  },
                  children: [for(int i=0;i<hand.length;i++) CachedNetworkImage(key: ValueKey(i),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    imageUrl: deck[i].imageURI['png'],
                    width: 100,
                  )],
                ),
              )
            ]
           ),
         ),
      ),
    );
  }
}


