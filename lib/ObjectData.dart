import 'Requests.dart';



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
class GameData{
  String name;
  List<User> players;
  int size;

  GameData({this.name,this.players,this.size});

  factory GameData.fromJson(var json) {
    return GameData(
        name:json['name'],
        players: [for(var p in json['players']) User.fromJson(p, [])],
        size: json['size']
    );
  }
  Map toJson() =>{
    'name':name,
    'players':players,
    'size':size,
    'format':1
  };
}
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
    var card = GlobalContainer.cards[json['name']];
    return CardData(card.name,card.imageURI,deckId);
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
  Map toJson()=>{
    'name':name
  };

}