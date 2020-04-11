import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
//final HashMap<String,CardData> cards= loadCards();

class CardData{
  final String name;
  final dynamic imageURI;
  int deckId;


  @override
  String toString() {
    return name;
  }

  CardData(this.name,this.imageURI,this.deckId);

  factory CardData.fromJson(var json) {

    return CardData(json['name'],json['image_uris'],-1);
  }
  factory CardData.fromDeck(var json,int deckId) {

    return CardData(json['name'],GlobalContainer.cards[json['name']],deckId);
  }
  Map toJson() => {
    'name': name,
    'deck': deckId
  };

  @override
  CardData cloneWithDeckId(int deckId) {
    return CardData(this.name,this.imageURI,deckId);
  }

}

class DeckData {
  String name;
  List<CardData> cards;
  int id;

  DeckData({this.name,this.cards,this.id});

  factory DeckData.fromJson(Map<String, dynamic> json) {

    return DeckData(
        name:json['name'],
        id: json['id'],
        cards: [for(var t in json['cards']) CardData.fromDeck(t,json['id'])]
    );
  }
  Map toJson() => {
    'name': name,
    'cards': cards
  };
}
class User {
  String name;
  int id;
  List<DeckData> decks;

  User({this.name,this.decks,this.id});

  factory User.fromJson(Map<String, dynamic> json, List<dynamic> decks) {
    return User(
        name:json['name'],
        id: json['id'],
        decks: [for(var t in decks) DeckData.fromJson(t)]
    );
  }

}
class GlobalContainer{
  static HashMap<String, CardData> cards;
  static User user;
  static String authtoken;
}
String ip = "http://127.0.0.1:8000/";

Future<int> login(String email,String password) async{
  Map<String, String> headers = {"Content-type": "application/json"};
  String body = jsonEncode({"password":password,'email':email});
  final response = await http.post(ip+"api/login/",headers:headers,body: body);
  var data=jsonDecode(response.body);
  print(data);
  GlobalContainer.user=User.fromJson(data['user'],data['decks']);
  print(data['decks']);
  GlobalContainer.authtoken=data['token'];



  return response.statusCode;
}
Future<int> getPublicDecks() async{
  Map<String, String> headers = {"Content-type": "application/json"};
  String body = jsonEncode({'username':GlobalContainer.user.name});
  final response = await http.post(ip+"api/decks/",headers:headers,body: body);
  GlobalContainer.user.decks=[for(var deck in jsonDecode(response.body)) DeckData.fromJson(deck)];
  return response.statusCode;



}
Future<int> updateDeck(DeckData data) async{
  Map<String, String> headers = {"Content-type": "application/json",HttpHeaders.authorizationHeader: "Token ${GlobalContainer.authtoken}"};
  String body = jsonEncode(data);
  print(body);

  final response = await http.put(ip+"api/decks/${data.id}/",headers: headers,body: body);
  print(response.statusCode);
  print(response.body);
  return response.statusCode;



}



