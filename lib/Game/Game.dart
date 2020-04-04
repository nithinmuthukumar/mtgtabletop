import 'package:flutter/cupertino.dart';
import 'package:mtap/Game/Card.dart';
import 'package:mtap/Requests.dart';

class Game extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

  }

}
class GameState extends State<Game>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(2, (index) => MagicCard(initPos:Offset(4,4),data: GlobalContainer.user.decks[0].cards[index])),
    );
  }

}