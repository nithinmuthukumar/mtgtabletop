import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtap/Game/Card.dart';
import 'package:mtap/Requests.dart';

import '../ObjectData.dart';

class Game extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

  }

}
class GameState extends State<Game> {
  DeckData data;
  List<Widget> fieldCards;


  @override
  void initState() {
    super.initState();
    data=GlobalContainer.user.decks[0];

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:fieldCards+<Widget>[
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: null,
            ),
          )
        ]
    );
  }
}