import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ObjectData.dart';

class Deck extends StatefulWidget{
  final List<CardData> deck;

  const Deck({Key key, this.deck}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>DeckState();


}
class DeckState extends State<Deck>{
  @override
  Widget build(BuildContext context) {
    return Card(
      //put card back image
      child: Text(widget.deck!=null?widget.deck.length.toString():"null"),
    );

  }

}