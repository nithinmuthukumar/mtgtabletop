import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtap/Game/Card.dart';

import '../Requests.dart';

class GamesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => GamesPageState();

}
class GamesPageState extends State<GamesPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
          children: <Widget>[
            Stack(
                children: List.generate(2, (index) => MagicCard(data: GlobalContainer.user.decks[0].cards[index]))),
          ],
        ),
    );
  }

}