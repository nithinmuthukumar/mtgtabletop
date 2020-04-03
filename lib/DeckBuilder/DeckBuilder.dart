import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Requests.dart';
class CardItem extends StatefulWidget{
  final CardData data;

  const CardItem({Key key, this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CardItemState();
  }
}
class CardItemState extends State<CardItem>{
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(widget.data.name),
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
        controller: deckListEntry,


      ),
      elevation: 30,
      actions: <Widget>[
        FlatButton(
          child: Text("Done"),
          onPressed: (){
            data.cards=[for(String name in deckListEntry.text.split('\n')) GlobalContainer.cards[name]];
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
          )
        ]
      ),

      body: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              TextField(
                onChanged: setResults,

              ),
              Column(
                children: searchResults,
              )
            ],
          ),

          ListView(
            children: List.generate(data.cards.length, (index) => CardItem(data:data.cards[index]))
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