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
  List<String> players;
  int size;

  GameData({this.name,this.players,this.size});

  factory GameData.fromJson(Map<String, dynamic> json) {
    return GameData(
        name:json['name'],
        players: json['players'],
        size: json['size']

    );
  }

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