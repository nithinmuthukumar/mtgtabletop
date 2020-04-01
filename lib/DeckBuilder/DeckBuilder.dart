import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Requests.dart';
class CardItem extends StatefulWidget{
  final Card card;

  const CardItem({Key key, this.card}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
class DeckBuilder extends StatefulWidget{
  DeckBuilder({Key key, this.deck}) : super(key: key);
  final DeckData deck;
  @override
  State<StatefulWidget> createState() => DeckBuilderState();

}
class DeckBuilderState extends State<DeckBuilder>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              TextField(

              ),
              ListView.builder(itemBuilder: (buildContext,index){
                return ListTile();
              })
            ],
          ),
          ListView(
            children: <Widget>[



            ],
          )
        ],
      ),

      
    );
  }

}