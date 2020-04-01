import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mtap/Pages/LoadPage.dart';

import 'Pages/AccountPage.dart';
import 'Pages/GamesPage.dart';
import 'Pages/StatsPage.dart';
import 'Requests.dart';
import 'Pages/DecksPage.dart';

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
      home: LoadPage(),
    );
  }
}

