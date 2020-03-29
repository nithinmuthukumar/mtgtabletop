import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecksPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => DecksPageState();

}
class DecksPageState extends State<DecksPage>{
  List<Widget> decks=List<Widget>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          MaterialButton(
            child:Icon(Icons.add),
            onPressed: (){
              setState(() {
                decks.add(deckWidget('big titty'));

              });
            },
            color: Colors.blueGrey,
            elevation: 8,
            shape: Border.all(width: 2.0, color: Colors.redAccent)
          )

        ],

      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 5,
        // Generate 100 widgets that display their index in the List.
        children: decks
      )
    );
  }
  Widget deckWidget(String name){
    return MaterialButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Deck $name',style:TextStyle(
                color: Colors.white
            ))
          ],
        ),
        shape: Border.all(color: Colors.blue)
    );
  }

}