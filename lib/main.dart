import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card-list-tile.dart';
import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
    );
  }
}

class CardDetail {
  String title;
  String subtitle;

  CardDetail({this.title, this.subtitle});
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<CardDetail> cards = [
    CardDetail(title: 'Map Tutorial', subtitle: 'Basic'),
    CardDetail(title: 'Provider', subtitle: 'Intermediate'),
    CardDetail(title: 'Fold Tutorial', subtitle: 'Basic'),
    CardDetail(title: 'Cubit', subtitle: 'Intermediate'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: appBar,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) => CardListTile(
                title: cards[index].title,
                subtitle: cards[index].subtitle,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  child: Text('Add Card'),
                  onPressed: () {
                    //TODO: Add a new card to cards with title 'Unit Testing' and subtitle of 'Intermediate'.
                    cards.add(
                      CardDetail(title: 'Unit Testing', subtitle: 'Intermediate'),
                    );
                    setState(() {});
                  },
                ),
                RaisedButton(
                  child: Text('Shuffle Cards'),
                  onPressed: () {
                    //TODO: Shuffle all cards and change the order of them in the UI
                    cards.shuffle();
                    setState(() {});
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
