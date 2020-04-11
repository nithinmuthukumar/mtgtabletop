import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtap/Game/Card.dart';

import '../Requests.dart';
class GameItem extends StatelessWidget{
  final List<User> players;
  final int totalPlayers;
  final String name;
  GameItem({this.players,this.totalPlayers,this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("fhf"),
    );

  }

}
class GamesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => GamesPageState();

}
class GamesPageState extends State<GamesPage>{
  TextEditingController gameName=TextEditingController();
  bool gameCreateDisabled=false;
  Widget createGameWidget(){
    return AlertDialog(
      content: TextField(
        controller: gameName,


      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Create",

          ),
          onPressed: (){
            setState(() {
              var game = GameData(name: gameName.text,players: [],size: 6);
              createGame(game);

            });
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
        leading: Container(),

        actions: <Widget>[
          FlatButton(
            child: Text(
              "Create Game"
            ),
            onPressed: (){
              showDialog(context: context,
                  builder: (BuildContext context)=> createGameWidget()
              );
            },
          )
        ],

      ),
    );
  }

}