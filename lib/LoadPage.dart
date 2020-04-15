import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'ObjectData.dart';
import 'Requests.dart';
import 'Pages/HomePage.dart';
import 'package:web_socket_channel/io.dart';

//parses card data from json String
HashMap<String,CardData> parseCardData(String str) {
  HashMap<String,CardData> cards=new HashMap();

  for (var cardData in json.decode(str)) {
    if(cardData['object']!='card') continue;

    var card = CardData.fromJson(cardData);
    cards[card.name] = card;


  }
  print("done");
  return cards;
}

class LoadPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>LoadState();


}
class LoadState extends State<LoadPage>{
  Future data;
  TextEditingController passwordController=TextEditingController();
  TextEditingController emailController=TextEditingController();

  bool loaded = false;
  @override
  void initState() {

    data = DefaultAssetBundle.of(context).loadString('assets/scryfall-default-cards.json');






  }
  void setCardData(String s) async {
    //asynchronously decodes json
    GlobalContainer.cards = await compute(parseCardData,s);

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
          if(!loaded){
            setCardData(snapshot.data);
            loaded=true;

          }

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


                      border: OutlineInputBorder(),

                    ),
                    obscureText: true,
                    controller: passwordController,



                  ),
                  FloatingActionButton(
                    child: Text("Login"),
                    onPressed: (){
                      login(emailController.text, passwordController.text).then((value) {
                            //GlobalContainer.channel = IOWebSocketChannel.connect("ws://127.0.0.1:6379");

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