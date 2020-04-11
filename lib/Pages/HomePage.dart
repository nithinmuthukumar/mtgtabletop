import 'package:flutter/material.dart';

import 'AccountPage.dart';
import 'DecksPage.dart';
import 'GamesPage.dart';
import 'StatsPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
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
        leading:Container(),
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
