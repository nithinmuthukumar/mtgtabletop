import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtap/DeckBuilder/DeckBuilder.dart';
import 'package:mtap/Requests.dart';


class DecksPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => DecksPageState();

}
class DecksPageState extends State<DecksPage>{
  List<Widget> decks;
  TextEditingController nameController=TextEditingController();
  @override
  void initState() {
    decks=List.generate(GlobalContainer.user.decks.length, (index) => deckWidget(index));
    super.initState();
  }
  Widget deckCreateWidget(){
    return AlertDialog(
      content: TextField(
        controller: nameController,
      ),
      elevation: 30,
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Create"
          ),
          onPressed: (){
            var newDeck=DeckData(name:nameController.text,cards:[]);
            createDeck(newDeck).then((value){
              GlobalContainer.user.decks.add(newDeck);
              setState(() {
                var d=decks;
                d.add(deckWidget(GlobalContainer.user.decks.length-1));
                decks=d;
              });
              Navigator.of(context).pop();


            });



          },
        )
      ],
    );

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          MaterialButton(
            child:Icon(Icons.add),
            onPressed: (){
              showDialog(context: context,
                  builder: (BuildContext context)=> deckCreateWidget()
              );
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
        children: List.generate(decks.length, (index) => decks[index])
      )
    );
  }
  Widget deckWidget(int index){
    return MaterialButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Deck ${GlobalContainer.user.decks[index].name}',style:TextStyle(
                color: Colors.white
            ))
          ],
        ),
        shape: Border.all(color: Colors.blue),
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DeckBuilder(deckIndex:index)),
        );
      },
    );
  }
}