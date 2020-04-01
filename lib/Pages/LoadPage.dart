import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Requests.dart';

class LoadPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>LoadState();


}
class LoadState extends State<LoadPage>{
  Future data;
  @override
  void initState() {
    loadCardData();


  }
  void loadCardData() async{
    data = DefaultAssetBundle.of(context).loadString('assets/scryfall-default-cards.json');
    for (var cardData in json.decode(await data)) {
      if(cardData['object']!='card') continue;

      var card = CardData.fromJson(cardData);
      GlobalContainer.cards[card.name] = card;

    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (context,snapshot){
        if(snapshot.hasError){
          print(snapshot.error);
        }
        if(snapshot.hasData){
          print(GlobalContainer.cards.length);
          return Scaffold(
            body: Center(
              child: Text('$GlobalContainer.cards.length'),
            ),
          );

        }else{
          return CircularProgressIndicator();
        }



      },
    );
  }
}