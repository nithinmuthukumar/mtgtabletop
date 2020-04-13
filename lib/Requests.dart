import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import 'ObjectData.dart';
//final HashMap<String,CardData> cards= loadCards();
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;





class GlobalContainer{
  static HashMap<String, CardData> cards;
  static User user;
  static String authtoken;
  static List<GameData> games=List<GameData>();
  static IOWebSocketChannel channel;

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
Future<int> createDeck(DeckData data) async{
  Map<String, String> headers = {"Content-type": "application/json",HttpHeaders.authorizationHeader: "Token ${GlobalContainer.authtoken}"};
  String body = jsonEncode(data);
  final response = await http.post(ip+"api/decks/",headers: headers,body: body);
  print(response.body);
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

void createGame(GameData data) async {
  GlobalContainer.channel.sink.add(jsonEncode(data));
  
}
void joinGame(GameData data) async {
  GlobalContainer.channel.sink.add('{join:${data.name}');
}




