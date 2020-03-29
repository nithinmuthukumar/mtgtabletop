import 'package:flutter/material.dart';
import 'package:mtgtabletop/AccountPage.dart';
import 'package:mtgtabletop/GamesPage.dart';
import 'package:mtgtabletop/StatsPage.dart';

import 'DecksPage.dart';

void main() {
  runApp(MtgApp());
}

class MtgApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MTG Table Top',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        canvasColor: Colors.black,

      ),
      home: MyHomePage(title: 'MTG Table Top'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController _tabController;


  @override
  void initState() {
    super.initState();
   _tabController =TabController(vsync: this,length: 4);


  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0x409966ff),
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 32
          ),
        ),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: 'Games',
            ),
            Tab(
              text: 'Decks',
            ),
            Tab(
              text: 'Stats',
            ),
            Tab(
              text: 'Account',
            )
          ],
          controller: _tabController,

        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo,Colors.blueGrey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            GamesPage(),
            DecksPage(),
            StatsPage(),
            AccountPage()
          ],
        ),
      ),

    );
  }
}
