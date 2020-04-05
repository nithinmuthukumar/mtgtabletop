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

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[

      ],

    );
  }

}