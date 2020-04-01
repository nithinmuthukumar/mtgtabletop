import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
//final HashMap<String,CardData> cards= loadCards();
class CardData {
  final String name;
  final dynamic imageURI;



  CardData(this.name,this.imageURI);

  factory CardData.fromJson(var json) {

    return CardData(json['name'],json['image_uris']);
  }
}

class DeckData {
  final String name;
  final List<CardData> cards;

  DeckData({this.name,this.cards});

  factory DeckData.fromJson(Map<String, dynamic> json) {
    return DeckData(
        name:json['name'],
        cards: [for(var t in json['cards']) CardData.fromJson(t)]
    );
  }
}
class User {
  final String name;
  final List<DeckData> decks;

  User({this.name,this.decks});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name:json['name'],
        decks: [for(var t in json['decks']) DeckData.fromJson(t)]
    );
  }

}
class GlobalContainer{
  static HashMap<String, CardData> cards=new HashMap<String,CardData>();
  static User user;
}
String ip = "http://127.0.0.1:8000/";
Future<User> login(String username,String password) async {
  final response = await http.get("http://127.0.0.1:8000/players/$username/$password");
  if(response.statusCode==200){
    return User.fromJson(json.decode(response.body));
  }else{
    throw Exception('Failed to load post');

  }
  // If the call to the server was successful, parse the JSON.



}

Future<int> register(String username,String password,String email) async{
  Map<String, String> headers = {"Content-type": "application/json"};
  String body = jsonEncode({"username":username,"password":password,'email':email});
  final response = await http.post(ip+"bookhub/users/",headers:headers,body: body);
  print(response.body);
  return response.statusCode;
}



