import 'package:flutter/cupertino.dart';

class DeckBuilder extends StatefulWidget{
  DeckBuilder({Key key, this.deck}) : super(key: key);
  final List<String> deck;
  @override
  State<StatefulWidget> createState() => DeckBuilderState();

}
class DeckBuilderState extends State<DeckBuilder>{
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

}