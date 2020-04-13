import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtap/Game/Card.dart';
import 'package:mtap/Game/Game.dart';

import '../ObjectData.dart';
import '../Requests.dart';
class GameItem extends StatelessWidget{
  final GameData data;
  GameItem({this.data});

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => Game()));
              showDialog(context: context,
                  builder: (BuildContext context)=> createGameWidget()
              );
            },
          )
        ],

      ),
//      body: StreamBuilder(
//        stream: GlobalContainer.channel.stream,
//        builder: (context, snapshot) {
//          if(snapshot.hasData){
//            var games = jsonDecode(snapshot.data);
//            return ListView(
//              children: [for(GameData game in games) GameItem()],
//            );
//          }
//          return CircularProgressIndicator();
//        },
//      ),
    );
  }

}