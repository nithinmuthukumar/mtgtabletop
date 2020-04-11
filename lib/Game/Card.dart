import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtap/Requests.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MagicCard extends StatefulWidget{
  final CardData data;
  final Offset initPos;


  const MagicCard({Key key, this.data, this.initPos}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MagicCardState();


}
class MagicCardState extends State<MagicCard>{

  Offset position = Offset(50,50);


  @override
  void initState() {
    super.initState();
    print(position);

    //position=widget.initPos;

  }

  @override
  Widget build(BuildContext context) {

    return Positioned(

      left: position.dx,
      top: position.dy,
      child: Draggable(

        data: widget.data,
        child: CachedNetworkImage(
          placeholder: (context, url) => CircularProgressIndicator(),
          imageUrl: widget.data.imageURI['png'],
          width: 100,
        ),
        onDraggableCanceled: (velocity, offset){
          setState(() {
            position=offset;
          });
        },
        feedback:  CachedNetworkImage(
          placeholder: (context, url) => CircularProgressIndicator(),
          imageUrl: widget.data.imageURI['png'],
          width: 100,
        )

      )
    );

  }

}