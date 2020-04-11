import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Requests.dart';

class CardItem extends StatelessWidget{
  final CardData data;
  CardItem({this.data});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text(data.name),
        onPressed: null
    );
  }
}

class DeckBuilder extends StatefulWidget{
  DeckBuilder({Key key, this.deckIndex}) : super(key: key);
  final int deckIndex;
  @override
  State<StatefulWidget> createState() => DeckBuilderState();

}
class DeckBuilderState extends State<DeckBuilder>{
  DeckData data;
  List<CardItem> searchResults=new List();
  TextEditingController deckListEntry=TextEditingController();

  @override
  void initState() {
    data=GlobalContainer.user.decks[widget.deckIndex];
  }
  Widget deckDataEntry(){
    return AlertDialog(
      content: TextField(
        maxLines: null,
        controller: deckListEntry,


      ),
      elevation: 30,
      actions: <Widget>[
        FlatButton(
          child: Text("Done"),
          onPressed: (){
            setState((){
              data.cards=[for(String name in deckListEntry.text.trim().split('\n')) if(GlobalContainer.cards[name.trim()]!=null) GlobalContainer.cards[name.trim()].cloneWithDeckId(data.id)];
            });
            print(GlobalContainer.user.decks);
            Navigator.of(context).pop();
          },
        )
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(context: context,
                  builder: (BuildContext context)=> deckDataEntry()
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              updateDeck(data);
            },
          )
        ]
      ),

      body: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: setResults,

                ),
                Column(
                  children: searchResults,
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
                children: List.generate(data.cards.length, (index) => CardItem(data:data.cards[index]))
            )
          )

        ],
      ),

      
    );
  }
  void setResults(text){
    setState(() {
      searchResults=[for(var value in GlobalContainer.cards.values) if (value.name.contains(text)) CardItem(data:value)];

    });
  }

}