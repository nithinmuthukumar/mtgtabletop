import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Requests.dart';
import 'HomePage.dart';

class LoadPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>LoadState();


}
class LoadState extends State<LoadPage>{
  Future data;
  TextEditingController passwordController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  @override
  void initState() {

    data = DefaultAssetBundle.of(context).loadString('assets/scryfall-default-cards.json').then((value) async{
      GlobalContainer.cards= await compute(parseCardData,value);

    });




  }
  HashMap<String,CardData> parseCardData(String str) {
    HashMap<String,CardData> cards;

    for (var cardData in json.decode(str)) {
      if(cardData['object']!='card') continue;

      var card = CardData.fromJson(cardData);
      cards[card.name] = card;

    }
    return cards;
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

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'email',
                      border: OutlineInputBorder(),


                    ),
                    controller: emailController,

                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'password',
                      border: OutlineInputBorder()
                    ),
                    controller: passwordController,



                  ),
                  FloatingActionButton(
                    child: Text("Login"),
                    onPressed: (){
                      login(emailController.text, passwordController.text).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title:"Mtgback")));
                      });
                      },

                  )


                ],
              )
            ),
          );

        }else{
          return CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          );
        }



      },
    );
  }
}