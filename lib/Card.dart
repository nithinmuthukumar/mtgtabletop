import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MagicCard extends StatefulWidget{
  final String name;
  final Offset initPos;


  const MagicCard({Key key, this.name, this.initPos}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MagicCardState();


}
class MagicCardState extends State<MagicCard>{

  Offset position = Offset(0,0);

  @override
  Widget build(BuildContext context) {

    return Positioned(

      left: position.dx,
      top: position.dy,
      child: Draggable(
        data: widget.name,
        child: FutureBuilder(
          future: ,
        ),
      )
    );

  }

}