import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
class AccountPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AccountPageState();

}
class AccountPageState extends State<AccountPage>{
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(imageUrl:'https://picsum.photos/250?image=9');
  }

}